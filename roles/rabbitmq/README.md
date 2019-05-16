# RabbitMQ

## Description

Install RabbitMQ Server

## Supports

* RedHat
* CentOS

## Requirements

### Tool

### Role

## Example Playbook

    - hosts: all
      roles:
        - role: system/epel
        - role: rabbitmq

## Variables

* ``rabbitmq_version``: RabbitMQ Version (string, default: '3.7.14')
* ``rabbitmq_version_full``: RabbitMQ Versin include suffix number (string, default: '3.7.14-1')
* ``rabbitmq_erlang_version``: RabbitMQ Erlang Version (string, default:'21.3.8.1')
* ``rabbitmq_erlang_version_full``: RabbitMQ Erlang Version include suffix number (string, default: '21.3.8.1-1')
* ``rabbitmq_node_port``: RabbitMQ Node port (number, default: 5672)
* ``rabbitmq_default_user``: user (string, default: 'rabbitmq')
* ``rabbitmq_default_pass``: password (string, default: 'rabbitmq')
* ``rabbitmq_erlang_cookie``: Erlang Cookie(string, default: ...)

