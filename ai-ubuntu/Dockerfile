FROM docker.io/library/ubuntu:24.04

RUN apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*

COPY ansible /tmp/ansible

RUN ansible-playbook /tmp/ansible/playbook.yml && rm -rf /tmp/ansible

USER distrobox
WORKDIR /home/distrobox
