# ansible-openssh-server 

## Description

Install openssh server

## Supports

* RedHat
* CentOS

## Example Playbook

    - hosts: target
      roles:
        - role: sshd

## Variables

* ``sshd_port``: sshd listen port (number, default:22)
* ``sshd_listen_addresses``: sshd listen address (String, default:0.0.0.0)
* ``sshd_Pubkey_authentication``: allow public key authentication (String (yes/no), default:yes)
* ``sshd_password_authentication``: allow password authentication (String (yes/no), default:yes)
