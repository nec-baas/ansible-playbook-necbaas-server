# ansible-vbox-vm

# Description

デプロイ済のVirtualBox VM　管理者の作成と sudo 権限設定

## Supports

* CentOS/RedHat

## Requirements

### Role

    role: openssh-server

## Example Playbook

    - hosts: target
      roles:
        - role: openssh-server
        - role: vbox-vm

## Variables

* ``vbox_mgr_username``: management username (String, default:"")
* ``vbox_mgr_password``: management user password (String, default:"")
* ``vbox_mgr_nopasswd``: management user sudo nopasswd configuration (String, default:ALL)
