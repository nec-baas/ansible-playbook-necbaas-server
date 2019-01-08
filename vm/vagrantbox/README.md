Vagrant Box VM イメージ作成
==========================

事前準備
--------

作成用ソフトの Vagrant と VirtualBox を事前にインストールしてください。

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

ディレクトリ（vm/vagrantbox)へ移動し、 config.sh.sample を config.sh にコピーする。

* VER= の値をバージョン名を指定する
* SERVER_VM_NAME= の値を上記のVagrant VM 名を指定する
* VAGRANT_BOX_NAME= の値を Vagrant Box イメージのエクスポート名称を指定する

3.Vagrant Box イメージの作成

ディレクトリ（vm/vagrantbox)の配下で、下記のコマンドを実行する。 イメージファイルは out/$VER ディレクトリ以下に生成される。

	$ ./create-vagrantbox.sh

4. necbaas サーバの公開 Box の利用方法

[vagrant-box-usage.md](./vagrant-box-usage.md) を参照してください。

5. Vagrant Box の公開手順

VagrantCloud の[マニュアル](https://www.vagrantup.com/docs/vagrant-cloud/boxes/create.html) を参照してください。

