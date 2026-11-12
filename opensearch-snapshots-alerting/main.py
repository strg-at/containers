import logging
import os
import sys
from collections.abc import Mapping
from datetime import date, datetime, timezone
from typing import Any

from opensearchpy import NotFoundError, OpenSearch

log_format = "%(name)s - %(levelname)s - %(message)s"
logging.basicConfig(format=log_format, level=logging.ERROR)

NO_SNAPSHOT_TODAY_MESSAGE = (
    "No snapshot has been successfully created today, please manually check the configuration!"
)


class SnapshotCheckError(Exception):
    pass


def env_flag(value: str | None, default: bool) -> bool:
    if value is None:
        return default
    return value.strip().lower() in ("true", "1")


def fetch_snapshots(client: OpenSearch, repository: str) -> list[dict[str, Any]]:
    try:
        client.snapshot.get_repository(repository=repository)
        response = client.snapshot.get(repository=repository, snapshot="_all")
    except NotFoundError as e:
        raise SnapshotCheckError(f"The repository {repository} wasn't found. Exiting.") from e
    except Exception as e:
        raise SnapshotCheckError(f"There was an exception: {e}. Exiting.") from e
    return response["snapshots"]


def check_snapshots(snapshots: list[dict[str, Any]], today: date) -> str:
    if not snapshots:
        raise SnapshotCheckError("No snapshots found in the repository!")

    finished = [s for s in snapshots if s.get("end_time_in_millis")]
    if not finished:
        raise SnapshotCheckError(NO_SNAPSHOT_TODAY_MESSAGE)

    latest = max(finished, key=lambda s: s["end_time_in_millis"])
    end_date = datetime.fromtimestamp(latest["end_time_in_millis"] / 1000, tz=timezone.utc).date()
    if latest.get("state") == "SUCCESS" and end_date == today:
        return f"The last snapshot was successfully executed today {today}."
    raise SnapshotCheckError(NO_SNAPSHOT_TODAY_MESSAGE)


def create_client(env: Mapping[str, str]) -> OpenSearch:
    username = env.get("OPENSEARCH_USERNAME")
    password = env.get("OPENSEARCH_PASSWORD")
    return OpenSearch(
        hosts=[{"host": env["OPENSEARCH_INSTANCE"], "port": int(env["OPENSEARCH_PORT"])}],
        http_auth=(username, password) if username and password else None,
        http_compress=True,
        use_ssl=env_flag(env.get("OPENSEARCH_TLS_ENABLED"), True),
        verify_certs=env_flag(env.get("OPENSEARCH_TLS_VERIFY_CERTS"), False),
        ssl_assert_hostname=False,
        ssl_show_warn=False,
    )


def main() -> None:
    instance = os.getenv("OPENSEARCH_INSTANCE")
    port = os.getenv("OPENSEARCH_PORT")
    repository = os.getenv("OPENSEARCH_SNAPSHOT_REPOSITORY")
    if not instance or not port or not repository:
        logging.error("At least one of the required environment variable is not set.")
        sys.exit(1)

    try:
        client = create_client(os.environ)
        snapshots = fetch_snapshots(client, repository)
        message = check_snapshots(snapshots, datetime.now(timezone.utc).date())
    except SnapshotCheckError as e:
        logging.error(str(e))
        sys.exit(1)
    except Exception as e:
        logging.error(f"There was an exception: {e}. Exiting.")
        sys.exit(1)
    print(message)


if __name__ == "__main__":
    main()
