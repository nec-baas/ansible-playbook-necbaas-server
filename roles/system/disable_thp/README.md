Disable Transparent Huge Pages(THP)
===================================

Description
-----------

Transparent Huge Pages (THP) を無効化する Role です。
MongoDB を使用する場合は無効化することが推奨されています。

https://docs.mongodb.org/manual/tutorial/transparent-huge-pages/

## Supports

* RedHat
* CentOS

## Example Playbook

    - hosts: target
      roles:
        - role: disable_thp
