# ansible-cleanup

# Description

* 不要な（フォルダ・ファイル、Proxy設定とユーザ）
* yum キャッシュの削除

## Supports

* CentOS/RedHat

## Requirements

### Role

    role: cleanup

## Example Playbook

    - hosts: target
      roles:
        - role: cleanup

## Variables

* ``cleanup_remove_users``: 削除ユーザのリスト (List, default:[])
* ``cleanup_remove_files``: 削除フォルド・ファイルのリスト (List, default:["/opt/download", "/etc/profile.d/proxy.sh"])

