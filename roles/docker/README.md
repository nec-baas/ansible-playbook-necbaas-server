# ansible-docker

## Description

Install Docker Engine

## Supports

* RedHat
* CentOS

## Example Playbook

     - hosts: target
         roles:
           - role: system/epel
           - role: docker

## Variables

* ``docker_uri``: Docker URI (default： unix:///var/run/docker.sock)

