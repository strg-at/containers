<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# github pr approval and merge tool

Automated tool for approving and merging github pull requests using github rest api.

## ENV

|                  | Description    |
| :--------------- | :------------- |
| **GITHUB_TOKEN** | PAT for GitHub |

## Arguments

```json
{
  "OWNER": "github repository owner/organization",
  "REPO": "repository name",
  "BRANCH": "branch to be merged",
  "BASE": "target branch for merge"
}
```

## How to test

build docker container

```shell
docker build -t approve-merge-pr ./approve-merge-pr
```

run with required arguments

```shell
docker run --rm --name approve-merge-pr \
  --env GITHUB_TOKEN="your_token" \
  approve-merge-pr \
  node index.js \
  '{
    "OWNER": "owner",
    "REPO": "repo",
    "BRANCH": "feature-branch",
    "BASE": "main"
  }'
```

or run the script with the required arguments:

```shell
node index.js \
  '{
    "OWNER": "owner",
    "REPO": "repo",
    "BRANCH": "feature-branch",
    "BASE": "main"
  }'
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

<!-- TBD -->

<!-- Badges -->

<!-- TBD -->
