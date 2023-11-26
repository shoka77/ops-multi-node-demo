# 概要

[OpenSearch](https://opensearch.org/)のクラスタにおけるマルチノード構成のデモです。  
既存の[Dockerイメージ](https://github.com/opensearch-project/docker-images)や[Helmチャート](https://github.com/opensearch-project/helm-charts)を使用せず、各ノードへの直インストールを前提としています。

構成は `CoodinatingNode`/`ManagerNode`/`DataNode` それぞれ1つずつとなります。  
各種ノード等についての説明は[こちら](https://opensearch.org/docs/latest/tuning-your-cluster/index/)が詳しいです。

`security-plugin`および`opensearch.yml`の設定の作用、およびマルチノード下での挙動を直で確認する目的で作成されています。

## 前提

- dockerおよびdocker-composeが利用可能であること。
  - https://docs.docker.jp/v1.12/compose/install.html

## 動作

 - 起動 
   - `docker-compose up --build --force-recreate`
   - `volume`指定でもいいかもしれませんが、`security-plugin`に関しては[反映にスクリプトの実行を要する](https://opensearch.org/docs/latest/security/configuration/security-admin)ため、再起動の方がラクという判断です。

## 補足

 - ログファイルは以下
   - `/var/log/opensearch/ops-cluster.log`
 - `security-plugin`のスクリプトは以下
   - `/usr/share/opensearch/plugins/opensearch-security/tools/`
