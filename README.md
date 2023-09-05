# NECモバイルバックエンド基盤 Ansible Playbook

NECモバイルバックエンド基盤サーバをセットアップする Ansible Playbook です。

## サポート環境


ターゲットホスト
- RHEL 8 (x64) または AlmaLinux 8 (x64)
- RHEL 7 (x64) または CentOS 7 (x64)
- Amazon Linux 2 (x64)

制御ホスト(Ansible を実行するホスト): Ansible 6.0 以上

Playbook 実行中に Internet 上のサイトから必要なソフトウェアをダウンロードするため、ターゲットホストは Internet に対して HTTP/HTTPS で通信できるようになっている必要があります。

## 事前準備

制御ホスト側に Ansible 6.0 以上をインストールしてください。

python3 および pip をインストールし、venv 環境を有効化してください。
以下に例を示します。

    $ python3 -m pip ~/.venv/default
    $ source ~/.venv/default/bin/activate

以下手順で ansible をインストールします。

    $ pip install -r requirements.txt

制御ホストからターゲットホストに同一ユーザ・パスワードなしで ssh でログインできるよう、ssh 鍵認証の設定を行ってください。
具体的には制御ホストの ssh 公開鍵を制御ホストの ~/.ssh/authorized_keys に追記してください。

ssh パスワードが必要な場合は、以降 ansible-playbook を実行する際に -k オプションが必要になります。
また、ユーザ名が異なる場合は -u オプションも必要です。

ターゲットホスト側は、sudo でスーパーユーザ権限でコマンドを実行できるように設定してください。
sudo はパスワードなしで実行できるようにすることを推奨します。
sudo 時にパスワードが必要な場合は、以降 ansible-playbook を実行する際に -K オプションが必要になります。

## Playbook の構成

* common.yml: Proxy設定、ulimit設定など共通設定を行います
* mongod.yml: MongoDB をインストールします
* tomcat.yml: Tomcat をインストールします
* baas-server.yml: BaaS サーバ(APIサーバ/Consoleサーバ)をインストールします
* ssepush.yml: SSEPush サーバをインストールします
* cloudfn.yml: Cloud Functions サーバをインストールします。

パラメータ(Variable)設定は group_vars 内の各ファイルに記述してください。
各パラメータ値の詳細は、各 Role (role/*) 内の README.md を参照してください。

## 実行方法

Ansible 実行前に Git submodule を更新してください。

    $ git submodule init
    $ git submodule update

ansible-playbook を実行します

    $ ansible-playbook -i [inventory_file] site.yml

inventory file にはデプロイ先のホスト名を指定してください。サンプルは hosts.sample ファイルにあります。

グループに設定したサーバに対し、各サーバソフトのインストールが実行されます。 
* mongodb グループ： MongoDB サーバ
* rabbitmq グループ： RabbitMQ サーバ
* baas-server グループ： BaaS サーバ
* ssepush-server グループ： SSEPush サーバ
* cloudfn-server グループ： Cloud Functions サーバ

## 制限事項

* fluentd サーバのインストールは未対応
* MongoDB はシングル構成のみ対応しています(レプリカセット・シャーディングは未対応)
* ファイヤウォールの設定は行いません。個別に開放を行ってください。

## Vagrant Box イメージ作成と利用

Ansible Playbook でデプロイした Vagrant Box の作成と利用手順は、
[vm/vagrantbox/README.md](vm/vagrantbox/README.md) を参照してください。

## VirtualBox VM イメージ作成と利用

Ansible Playbook でデプロイした Vagrant Box から、 VirtualBox VM 用イメージへの作成と利用手順は、
[vm/virtualbox/README.md](vm/virtualbox/README.md) を参照してください。
