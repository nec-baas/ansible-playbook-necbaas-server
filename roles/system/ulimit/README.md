ulimit 設定
===========

Description
-----------

ulimit の設定を行います。

設定ファイルは /etc/security/limits.d に投入されます。

Variables
---------

* ``ulimit_nproc``: 最大プロセス数 (number, default: 64000)
* ``ulimit_nofile``: 最大オープンファイル数 (number, default:64000)
