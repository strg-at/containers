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

# gcloud-workstation-phpstorm

This is basic config for cloud workstation image used for development under docker container with preinstalled commands.

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [How to test](#how-to-test)
- [Custom scripts](#custom-scripts)
- [Debug locally](#debug-locally)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## How to test

build container

```console
docker buildx build -t gcloud-workstation-phpstorm ./gcloud-workstation-phpstorm
```

run container

```console
docker run --rm -it --privileged --name gcloud-workstation-phpstorm gcloud-workstation-phpstorm
```

access IDE

phpstorm is only accessible via [jetbrains gateway][jetbrains-gateway].

## Custom scripts

A startup script executes on every workstation startup and tries to execute any bash (`sh` extension) scripts present in /home/user/scripts (folder to be manually created by the user if needed).

If any script was not executed properly, it will be logged to /tmp/custom-scripts.log.

## Debug locally

You can test the image locally using the following commands inside of this directory:

```bash
docker build . -t gcloud-workstation-vscode
docker run -it --privileged --tmpfs /run --rm --name gcloud-workstation-vscode gcloud-workstation-phpstorm
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[jetbrains-gateway]: https://www.jetbrains.com/remote-development/gateway/

<!-- Badges -->
