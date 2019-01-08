necbaas サーバの公開 Box の利用方法
=====================================

[VagrantCloud](https://vagrantcloud.com/)に公開中のサーバ Box は、 [necbaas box](https://app.vagrantup.com/necbaas)を確認してください。

* baas-server: API/Console Server を プリインストールする BOX
* All-In-One Servers: API/Console Server、 SSEPush Server と Cloud Functions Server を プリインストールする BOX
* 上記サーバのベース BOX は、 [centos/7](https://app.vagrantup.com/centos/boxes/7) v1811.02 になる

Box の起動方法
----------------

Vagrantfile.necbaas の Box 名とバージョンを指定した後、 VM を起動します。 

* config.vm.box = の値を公開 Box 名を指定する（default: "necbaas/baas-server")
* config.vm.box_version = の値をバージョン名を指定する（default: "7.5.1")

起動するコマンド

	$ VAGRANT_VAGRANTFILE=Vagrantfile.necbaas vagrant up

コンソールサーバに接続
-----------------------
  
EC2 起動後、 ブラウザを起動して http://localhost:28080/console にアクセスします。

* コンソールサーバ 初期アカウント(ID:admin@example.com, password: admin) 

ライセンスキー投入
-------------------

ライセンスキー投入手順は下記の通りです。

* コンソールの「管理」 → 「ライセンスキー」をクリックし、「編集」をクリックして編集画面に遷移します。
* 「ライセンスキー」に配布されたライセンスキーの内容をコピー＆ペーストして「更新」します。
* 無償版ライセンスキーを利用する場合は、[こちら](https://nec-baas.github.io/downloads.html)から入手します。

REST API 利用
--------------

* http://localhost:28080/api がベース URI になります。 
* 利用方法について [REST API ガイド](https://nec-baas.github.io/baas-manual/latest/developer/ja/rest/index.html)を参照してください。

その他のサーバ利用
-------------------

[マニュアル](https://nec-baas.github.io/documents.html)を参照してください。
