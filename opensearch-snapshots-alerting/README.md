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

## How to test

build container

```shell
docker build -t opensearch-snapshots-alerting ./opensearch-snapshots-alerting
```

run container against a port-forwarded OpenSearch cluster that has a snapshot repository

```shell
docker run --rm --network host --name opensearch-snapshots-alerting \
  --env OPENSEARCH_INSTANCE="localhost" \
  --env OPENSEARCH_PORT="9200" \
  --env OPENSEARCH_SNAPSHOT_REPOSITORY="repository" \
  opensearch-snapshots-alerting
```

exit code `0` means a snapshot succeeded today. exit code `1` means it did not, and the job logs the error.
