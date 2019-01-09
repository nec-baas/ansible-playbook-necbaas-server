necbaas サーバのVirtualBox VM の利用方法
=========================================

事前準備
---------

* VirtualBox 5.x 以上が必要です。事前にインストールしておいてください。
* 「BaaS VM イメージ」は OVA ファイルとして提供されます。[こちら](https://github.com/nec-baas/baas-server/releases)からダウンロードしてください。
   * baas-server-[version].OVA : API/Console サーバ
   * all-in-one-servers-[version].OVA: API/Console サーバ, Cloud Functions サーバと SSEPush サーバ
  
イメージファイルのインポートと起動
------------------------------

* VirtualBox VM Manager を起動します。
* 「ファイル」→「仮想アプライアンスのインポート」を選択し、 OVAファイルのパスを指定して、「次へ」をクリックします。 
* イメージが取り込まれたら、イメージを選択して起動します。

BaaS コンソールの接続
---------------------

* ブラウザを起動して http://localhost:8080/console にアクセスします。 
* 初期アカウント(ID:admin@example.com, password: admin) でログインします。

ライセンスキーの投入
-------------------

* コンソールの「管理」→「ライセンスキー」をクリックし、「編集」をクリックして編集画面に遷移します。
* 「ライセンスキー」に、配布されたライセンスキーの内容をコピー＆ペーストして「更新」します。
   * 無償版ライセンスキーを利用する場合は、[こちら](https://nec-baas.github.io/downloads.html)から入手します。

REST API の利用
----------------

* http://localhost:8080/api がベース URI になります。
* 利用方法について [REST API ガイド](https://nec-baas.github.io/baas-manual/latest/developer/ja/rest/index.html)を参照してください。

仮想サーバへのログイン
---------------------

* 仮想サーバへ、localhost:2222 経由で ssh ログイン可能 （管理者アカウント ID:admin, password:admin） です。 
* なお、 VirtualBox コンソールからもログイン可能ですが、キーボードが英語配列になっていますので、注意ください。

その他のサーバ利用
-------------------

[マニュアル](https://nec-baas.github.io/documents.html)を参照してください。


仮想マシンの仕様
------------------

項目            | 仕様　　　　　      | 備考       
--------------- | ------------------ | ------------------------------------------------- |
OS              | CentOS7.6　※１      |                                                  |
necbaas servers | -                  | VM イメージファイルの取得先で確認                     |
Tomcat          | 9.0.14 以上 ※１     | インストール先 /opt/tomcat9                        |
MongoDB         | 4.0.5  以上 ※１     /                                                  |
OpenJDK         | 1.8.0_191 以上 ※１  |                                                  |
Network         | NAT                | 22 -> 2222, 8080 -> 8080 のポートフォワード設定済み  |
Proxy           | 設定なし            |                                                  |
SELinux         | enforcing          |                                                  |

※１ VM イメージ作成時の最新版を適用しています。
