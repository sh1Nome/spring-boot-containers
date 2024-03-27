# 概要

VSCodeの拡張機能であるDev Containersを利用したSpringBootアプリケーションの開発環境。<br>
データベースはMySQL。<br>

# 前提

* ホストにDockerが導入されていること
* ホストにVSCodeが導入されていること
* ホストのVSCodeにDevContainersの拡張機能が導入されていること
* ホストの作業ユーザでSSHKeyを作成し、公開鍵をGitHubに登録していること

# 使い方

## 開発環境の起動方法

1. VSCodeでこのリポジトリを開く
1. `docker-compose.yml`の以下の値を書き換える
    * GIT_USER_NAME
    * GIT_USER_EMAIL
    * GIT_SSH_URL
    * MYSQL_ROOT_PASSWORD
    * MYSQL_DATABASE
    * MYSQL_USER
    * MYSQL_PASSWORD
1. VSCodeのコマンドパレットで以下を選択
    * `Dev Containers: Reopen in Container`
1. 起動したコンテナ内で`git_clone.sh`を実行

## その他

* `docker-compose.yml`や`Dockerfile`を変更した場合は、以下からコンテナを起動
    * `Dev Containers: Rebuild and Reopen in Container`
    * `Dev Containers: Rebuild Without Cache and Reopen in Container`
* 起動したコンテナから抜けたい場合は、コマンドパレットで以下を選択
    * `Dev Containers: Reopen Folder Locally`
