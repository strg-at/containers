# opensearch-snapshots-alerting

Checks that OpenSearch created a snapshot today. The job exits with code 1 if it did not.

## ENV

|                                    | Description                                     |
| :--------------------------------- | :---------------------------------------------- |
| **OPENSEARCH_INSTANCE**            | OpenSearch host                                 |
| **OPENSEARCH_PORT**                | OpenSearch port                                 |
| **OPENSEARCH_SNAPSHOT_REPOSITORY** | snapshot repository name                        |
| **OPENSEARCH_USERNAME**            | username (optional)                             |
| **OPENSEARCH_PASSWORD**            | password (optional)                             |
| **OPENSEARCH_TLS_ENABLED**         | use TLS (optional, default `true`)              |
| **OPENSEARCH_TLS_VERIFY_CERTS**    | verify certificates (optional, default `false`) |

## Test

Run the job against an OpenSearch cluster that has a snapshot repository:

```sh
OPENSEARCH_INSTANCE=localhost \
OPENSEARCH_PORT=9200 \
OPENSEARCH_SNAPSHOT_REPOSITORY=strg \
OPENSEARCH_TLS_ENABLED=false \
uv run main.py
echo $?
```

Exit code `0` means a snapshot succeeded today. Exit code `1` means it did not, and the job logs the error.
