NECモバイルバックエンド基盤 Ansible Playbook
============================================

NECモバイルバックエンド基盤サーバをセットアップする Ansible Playbook です。

サポート環境
------------

ターゲットホスト: RHEL 7 (x64) または CentOS 7 (x64)

制御ホスト(Ansible を実行するホスト): Ansible 2.0 以上

Playbook 実行中に Internet 上のサイトから必要なソフトウェアをダウンロードするため、ターゲットホストは Internet に対して HTTP/HTTPS で通信できるようになっている必要があります。

事前準備
--------

制御ホスト側に Ansible 2.0 以上をインストールしてください。

- CentOS/RHEL の場合は先に EPEL をインストールし、yum install ansible でインストールしてください。
- Ubuntu の場合は apt-get install ansible でインストールしてください。

制御ホストからターゲットホストに同一ユーザ・パスワードなしで ssh でログインできるよう、ssh 鍵認証の設定を行ってください。
具体的には制御ホストの ssh 公開鍵を制御ホストの ~/.ssh/authorized_keys に追記してください。

ssh パスワードが必要な場合は、以降 ansible-playbook を実行する際に -k オプションが必要になります。
また、ユーザ名が異なる場合は -u オプションも必要です。

ターゲットホスト側は、sudo でスーパーユーザ権限でコマンドを実行できるように設定してください。
sudo はパスワードなしで実行できるようにすることを推奨します。
sudo 時にパスワードが必要な場合は、以降 ansible-playbook を実行する際に -K オプションが必要になります。

Playbook の構成
---------------

* common.yml: Proxy設定、ulimit設定など共通設定を行います
* mongod.yml: MongoDB をインストールします
* tomcat.yml: Tomcat をインストールします
* baas-server.yml: BaaS サーバ(APIサーバ/Consoleサーバ)をインストールします

パラメータ(Variable)設定は group_vars 内の各ファイルに記述してください。
各パラメータ値の詳細は、各 Role (role/*) 内の README.md を参照してください。

実行方法
--------

Ansible 実行前に Git submodule を更新してください。

    $ git submodule update

ansible-playbook を実行します

    $ ansible-playbook -i [inventory_file] site.yml

inventory file にはデプロイ先のホスト名を指定してください。サンプルは hosts.sample ファイルにあります。
mongodb グループに対して MongoDB サーバのインストール、baas-server グループに対して BaaS サーバの
インストールが実行されます。 

制限事項
--------

* SSE Push サーバ、Cloud Functions サーバのインストールは未対応
* RabbitMQサーバ、fluentd サーバのインストールは未対応
* MongoDB はシングル構成のみ対応しています(レプリカセット・シャーディングは未対応)
* ファイヤウォールの設定は行いません。個別に開放を行ってください。
