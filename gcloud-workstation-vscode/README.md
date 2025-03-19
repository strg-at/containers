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

# gcloud-workstation-vscode

This is basic config for cloud workstation image used for development under docker container with preinstalled commands.

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [How to test](#how-to-test)
- [How to update scripts and config files](#how-to-update-scripts-and-config-files)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## How to test

build container

```console
docker buildx build -t gcloud-workstation-vscode ./gcloud-workstation-vscode
```

run container

```console
docker run --rm -it -p 2022:22 -p 8084:80 --privileged --name gcloud-workstation-vscode gcloud-workstation-vscode
```

access IDE

vscode is accessible via [localhost:8084](http://localhost:8084).

## How to update scripts and config files

Various scripts and configuration files are available in the config/ and scripts/ folder. These are symlinks to the actual directories from /gcloud-workstation-files. Updating any of them updates it for both vscode & phpstorm.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

<!-- Badges -->
