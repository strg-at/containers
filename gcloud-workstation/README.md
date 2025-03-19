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

<details>
  <summary style="font-size:1.2em;">Table of Contents PHPSTORM</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [gcloud-workstation-phpstorm](#gcloud-workstation-phpstorm)
  - [How to test vscode](#how-to-test-vscode)
- [gcloud-workstation-vscode](#gcloud-workstation-vscode)
  - [How to test phpstorm](#how-to-test-phpstorm)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

# gcloud-workstation-phpstorm

This is a basic config for cloud workstation image used for development under docker container with preinstalled commands.

## How to test vscode

build container (from gcloud-workstation parent folder)

```console
docker buildx build -t gcloud-workstation-phpstorm -f Dockerfile.phpstorm .
```

run container

```console
docker run --rm -it --privileged --name gcloud-workstation-phpstorm gcloud-workstation-phpstorm
```

access IDE

phpstorm is only accessible via [jetbrains gateway][jetbrains-gateway].

# gcloud-workstation-vscode

This is a basic config for cloud workstation image used for development under docker container with preinstalled commands.

## How to test phpstorm

build container (from gcloud-workstation parent folder)

```console
docker buildx build -t gcloud-workstation-vscode -f vscode/Dockerfile .
```

run container

```console
docker run --rm -it -p 2022:22 -p 8084:80 --privileged --name gcloud-workstation-vscode gcloud-workstation-vscode
```

access IDE

vscode is accessible via [localhost:8084](http://localhost:8084).

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[jetbrains-gateway]: https://www.jetbrains.com/remote-development/gateway/

<!-- Badges -->
