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

[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]


# gcloud-workstation-base

This is basic config for cloud workstation image used for development under docker container with preinstalled commands.

## ENV

|                         | Description             |
| :---------------------- | :---------------------- |

| (\*) required

## How to test

build docker container

```console
docker build -t gcloud-workstation-base ./gcloud-workstation-base
```

run gcloud-workstation-base container

```console
docker run --rm -it --name gcloud-workstation-base gcloud-workstation-base
```

## Notice

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[pre-commit]: https://pre-commit.com/
[yamllint]: https://github.com/adrienverge/yamllint
[php]: https://www.php.net/
[php-cs-fixer]: https://github.com/PHP-CS-Fixer/PHP-CS-Fixer
[phpstan]: https://github.com/phpstan/phpstan

<!-- Badges -->

[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&style=for-the-badge
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/Taskfile-Enabled-brightgreen?logoColor=white&style=for-the-badge


<!-- TBD -->
