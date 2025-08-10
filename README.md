# Distrobox Container Collection

This repository provides a collection of custom containers designed for use with [distrobox](https://github.com/89luca89/distrobox). Each container is built for specific use cases, such as AI coding agents or office productivity, and can be exported for seamless integration with your host system.

## Images

### ai

A container image with all the AI coding agents installed.  
- Built from Arch Linux.
- Installs base-devel, git, yay (AUR helper), and various AI tools.
- Includes a script to export installed command-line applications using `distrobox-export`.

### open-office

A container image for office productivity.
- Built from Arch Linux.
- Installs OpenOffice via yay from the AUR.
- Configures a dedicated user and sets up sudo for automation.
- Can be exported for use on the host.

## Usage

Each image can be built and exported using distrobox.  
See the respective Dockerfiles and GitHub Actions workflows for build details.

a place to build distoboxes and custom container stuff

So far we have:
- ai - a distrobox that has all the ai coding agents installed
