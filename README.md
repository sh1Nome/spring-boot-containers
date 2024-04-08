# 概要
SpringBootアプリケーションに関するコンテナ

# メモ
本番環境はApache HTTP Server -> Tomcatにしたい。<br>

# 利用手順
コマンドは`docker-compose.yml`があるディレクトリで実行すること<br>

### コンテナの起動方法
```
docker compose up -d --build db adminer
```

### コンテナの停止方法
```
docker compose down --rmi local -v
```

# MySQLデータの永続化
`data`ディレクトリ内にコンテナで立てたMySQLのデータが入る。<br>

### データの初期化方法
`data`ディレクトリ内の`.gitignore`以外を削除

### データのバックアップ方法
`data`ディレクトリを任意の場所にコピペ
