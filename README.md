# 概要
SpringBootアプリケーションに関するコンテナ

# メモ
本番環境はApache HTTP Server -> Tomcatにしたい。<br>

# 詳細
`docker-compose.dev.yml`は開発環境用で`docker-compose.prod.yml`は本番環境用。<br>
DevContainersは`docker-compose.dev.yml`を起動するように設定してある。<br>

# 開発環境利用手順書

### コンテナの起動
1. `docker-compose.dev.yml`の`environment`を設定する
1. ターミナルで以下コマンドを実行する
    * `docker compose -f docker-compose.dev.yml up -d --build`

### 起動中のコンテナにVSCodeで接続
1. コマンドパレットで以下を実行する
    * `DevContainers: Reopen in Container`
1. すべての拡張機能のインストールが終わるまで待つ
1. （コンテナ起動後、初接続の場合）ターミナルを開き、以下コマンドを実行する
    * `./git_clone.sh`
1. 任意のJavaファイルを開く
1. ステータスバーの「Java ***」が「Java Ready」となるまで待つ

### 接続中のコンテナから抜ける
1. コマンドパレットで以下を実行する
    * `DevContainers: Reopne Folder Locally`

### コンテナの停止
1. ターミナルで以下コマンドを実行する
    * `docker compose -f docker-compose.dev.yml down --rmi local -v`

# 注意点
* 接続中のコンテナから抜ける前にPushしておくこと
