# MongoDB: mongod

## Description

mongod をインストールします。

## Supports

* RedHat
* CentOS

## Requirements

### Role

* mongodb/common

## Example Playbook

    - hosts: target
      roles:
        - role: mongod

## Variables

* ``mongodb_mongod_bind_ip``: bind する IPアドレス (default:0.0.0.0)
* ``mongodb_mongod_port``: bind するポート番号 (default:27017)

* ``mongodb_enable_auth``: 認証機能の使用 (default:false)
* ``mongodb_admin_user``: 認証ユーザID (default:'')
* ``mongodb_admin_password``: 認証パスワード(default:'')

* ``mongodb_enable_replication``: レプリカセットの使用 (default:false)
* ``mongodb_repl_set_name``: レプリカセット名(default:'rs0')

* ``mongodb_enable_sharding``: シャードサーバ(default:false)
