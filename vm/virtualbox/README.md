VirtualBox VM イメージ作成
==========================

事前準備
--------

作成用ソフトは、Vagrant と VirtualBox を事前にインストールしてください。

* Vagrant： v2.0 以上
* VirtualBox: v5.1 以上


作成手順
--------

以下の手順で行う。

1. 事前準備

ディレクトリ（ansible-playbook-necbaas-server)へ移動する。 Vagrant Box VM を起動し、 Playbook でサーバをデプロイする。

例） ホスト(vagrant)へサーバをデプロイする

	$ cd ../../
	$ ansible-playbook -i hosts-vagrant site.yml

2. config.sh の編集

ディレクトリ（vm/virtualbox/)へ移動し、 config.sh.sample を config.sh にコピーする。

* VER= の値をバージョン名を指定する
* SERVER_VM_NAME= の値を上記のVagrant VM 名を指定する
* VBOX_VM_NAME= の値を VirtualBox VM (VBOX VM) イメージのエクスポート名称を指定する
* VBOX_VM_MEMORY= の値を VBOX VM に割り当てメモリ容量を指定する
* VBOX_NAT_PORT_FORWARDING= の値を VBOX VM の NAT のポートフォワーディングの設定を指定する
* VBOX_MGR_USER=　の値を VBOX VM 管理者を指定する
* VBOX_MGR_PASSWORD= の値を VBOX VM 管理者パスワードを指定する
* VBOX_REMOVE_USERS= の値を VBOX VM の削除ユーザリストを指定する

以下は VBOX VM 製品とベンダー情報が必要に応じて追記する

* VBOX_PRODUCT=
* VBOX_PRODUCT_URL=
* VBOX_VENDOR=
* VBOX_VENDOR_URL=
* VBOX_VERSION=
* VBOX_DESCRIPTION=

3. Inventory ファイルを修正する。

Inventory ファイル（host）で [vbox-vm] グループに、1.でサーバをデプロイしたホストを指定する。

前述の例の場合は、 vagrant になる。

4. VirtualBox VM イメージの作成

ディレクトリ（vm/virtualbox)の配下で、下記のコマンドを実行する。 イメージファイル（OVA形式）は out/$VER ディレクトリ以下に生成される。

	$ ./create-virtualbox.sh

5. necbaas サーバの公開 VirtualBox VM イメージ の利用方法

[virtualbox-vm-usage.md](./virtualbox-vm-usage.md) を参照してください。
