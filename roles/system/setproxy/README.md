# Proxy 設定

## Description

Proxy 設定を行います。

* /etc/yum.conf に Proxy 設定が投入されます。
* /etc/profile.d/proxy.sh に Proxy 環境変数が投入されます。

## Example Playbook

    - hosts: target
      vars:
        setproxy_url: 'http://proxy.example.com:3128'
      
      roles:
        - setproxy

## Variables

* ``setproxy_url``: プロキシサーバ。空文字列を設定すると設定変更しない。
