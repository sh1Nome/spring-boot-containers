# 概要
SpringBootアプリケーションに関するコンテナ

# 詳細
`docker-compose.dev.yml`は開発環境用で`docker-compose.prod.yml`は本番環境用。<br>
各ファイルの`environment`の値を設定してから使用すること。
DevContainersは`docker-compose.dev.yml`を起動するように設定してある。

# よく使うコマンド
### VSCodeでコマンドパレットを開く
Ctrl + Shift + P<br>

### DevContainersで開発環境を開く
コマンドパレットで以下を選択
```
DevContainers: Reopen in Containers
```

### DevContainerで開発環境を閉じる
コマンドパレットで以下を選択
```
DevContainers: Reopne in Folder
```

### 開発環境を削除する
```
docker compose -f docker-compose.dev.yml down --rmi local -v
```
