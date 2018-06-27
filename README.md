## Coderetreat でペアプロの相手を適当に決める

### ファイル一覧
* Dockerfile : railsコンテナ(web)用の設定(ひとまずrubyを入れる)
* docker-compose.yml : railsコンテナ(web)とpostgresqlコンテナ（db)の設定
* .env: パスワードファイル（パスワードは適当に変えてね）

### 使い方
Dockerが入っていることが前提です。

1. ビルドします
> % docker-compose build
2. データベース設定をする（config/database.ymlは適当に書き換えてね）
> % cp config-database.yml config/database.yml
3. railsサーバを立ち上げる
> * % docker-compose up
> * (Ctrl-Cでプロセスを落とす)
4. データベースを作る
> * % docker-compose run web rails db:create
> * % docker-compose run web rails db:migrate
5. railsサーバを立ち上げる
> % docker-compose up
