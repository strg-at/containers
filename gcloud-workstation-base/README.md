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

# gcloud-workstation-base

This is basic config for cloud workstation image used for development under docker container with preinstalled commands.

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [How to test](#how-to-test)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## How to test

build docker container

```console
docker build -t gcloud-workstation-base ./gcloud-workstation-base
```

run gcloud-workstation-base container

```console
docker run --rm -it --name gcloud-workstation-base gcloud-workstation-base
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

<!-- Badges -->

<!-- TBD -->
