#!/usr/bin/env python

from opensearchpy import OpenSearch, client, NotFoundError
from datetime import datetime, date
import os, logging

# General logging configuration
log_format = '%(name)s - %(levelname)s - %(message)s'
logging.basicConfig(format=log_format, level=logging.ERROR)
logging.getLogger(__name__)

def getSnapshotRepository(os_instance, snapshotRepository):
    try:
        if(client.snapshot.SnapshotClient(os_instance).get_repository(repository=snapshotRepository)):
            return True
    except NotFoundError:
        logging.error(f"The repository {snapshotRepository} wasn't found. Exiting.")
    except Exception as e:
        logging.error(f"There was an exception: {e}. Exiting.")
    return False

def getSnapshots(os_instance, snapshotRepository):
    try:
        return client.snapshot.SnapshotClient(os_instance).get(repository=snapshotRepository, snapshot='_all')
    except Exception as e:
        logging.error(f"There was an exception: {e}. Exiting.")
    return False

def getSnapshotDetails(os_instance, snapshotRepository, snapshotIndex):
    try:
        snapshotsList = getSnapshots(os_instance, snapshotRepository)
        if(len(snapshotsList["snapshots"]) > 0):
            state = snapshotsList["snapshots"][snapshotIndex]["state"]
            date = datetime.strptime(snapshotsList["snapshots"][snapshotIndex]["end_time"],'%Y-%m-%dT%H:%M:%S.%fZ').strftime("%m/%d/%y")
            name = snapshotsList["snapshots"][snapshotIndex]["snapshot"]
            details = {'state': state, 'date': date, 'name': name }
            return details
    except Exception as e:
        logging.error(f"There was an exception: {e}. Exiting.")
    return False

def main():
    instance = os.getenv("OPENSEARCH_INSTANCE")
    opensearchUsername = os.getenv("OPENSEARCH_USERNAME")
    opensearchPassword = os.getenv("OPENSEARCH_PASSWORD")
    opensearchPort = os.getenv("OPENSEARCH_PORT")
    snapshotRepository = os.getenv("OPENSEARCH_SNAPSHOT_REPOSITORY")
    sslEnabled = os.getenv("OPENSEARCH_TLS_ENABLED", "True") in ("true", "True", 1)
    verifyCerts = os.getenv("OPENSEARCH_TLS_VERIFY_CERTS", "False") in ("true", "True", 1)

    if(not instance or not opensearchPort or not snapshotRepository):
        logging.error(f"At least one of the required environment variable is not set.")
        exit(1)

    os_client = OpenSearch(
        hosts = [{'host': instance, 'port': opensearchPort}],
        http_auth = (opensearchUsername, opensearchPassword) if opensearchUsername and opensearchPassword else "",
        http_compress = True,
        use_ssl = sslEnabled,
        verify_certs = verifyCerts,
        ssl_assert_hostname = False,
        ssl_show_warn = False
    )

    todaysDate = date.today()

    if(getSnapshotRepository(os_client, snapshotRepository)):
        # Snapshot repo exists, we can continue
        print(len(getSnapshots(os_client, snapshotRepository)))
        snapshotsCount = len(getSnapshots(os_client, snapshotRepository)["snapshots"])
        if snapshotsCount > 0:
            lastSnapshot = getSnapshotDetails(os_client, snapshotRepository, snapshotsCount - 1)
            lastSnapshotYear="20" + lastSnapshot['date'][6:8]
            lastSnapshotMonth=lastSnapshot['date'][0:2]
            lastSnapshotDay=lastSnapshot['date'][3:5]
            lastSnapshotDate=lastSnapshotYear + "-" + lastSnapshotMonth + "-" + lastSnapshotDay
            lastSnapshotState=lastSnapshot['state']
            if(lastSnapshotState == "SUCCESS" and lastSnapshotDate == str(todaysDate)):
                print(f"The last snapshot was successfully executed today {todaysDate}.")
            else:
                logging.error("No snapshot has been successfully created today, please manually check the configuration!")
        else: logging.error("No snapshots found in the repository!")

if __name__ == "__main__":
    main()
