# アプリ名：pomopomo(ポモポモ)
### URL: https://pomopomo.tk/

## 動作確認用アカウント(一般ユーザー)
- メールアドレス: `test@gmail.com`
- パスワード: `testtest`  

※Twitter/Googleアカウントからもログインが可能です

## 動作確認用アカウント(管理者ユーザー)
- メールアドレス: 非公開  
- パスワード: 非公開  

<img width="800" alt="admin_img" src="https://user-images.githubusercontent.com/11900792/59001818-0d629500-884b-11e9-968f-0b13da342e5a.png">

※セキュリティの観点から、予告なく本アカウントを削除する場合もあります。
ご了承ください。

## 概要
ポモドーロ・テクニック(25分作業・５分休憩のサイクル)を活用した作業集中アプリ。

## コンセプト
好きな音楽を聴きながら作業に集中できる。音楽検索機能・タイマー機能・掲示板機能あり。  
PCで作業をする全ての人をターゲットとしている。

## 機能および活用した技術一覧
- **ログイン機能/ユーザー登録機能**
    - devise、Oauth(Twitter・Google)を使用
- **音楽検索・再生機能**
    - Mixcloud、YoutubeのWeb APIを使用
- **タイマー機能**
    - JavaScriptを使用
- **掲示板機能**
    - Ajaxによる投稿機能・いいね機能を実装
- **管理者権限**
- **辞書機能**

## その他使用した技術
- **フロントエンド**
    - Bootstrap
    - Scss
    - JQuery
- **サーバーサイド**
    - Ruby 2.5.5
    - Rails 5.2.3
- **データベース**
    - PostgreSQL
- **インフラ**：ドメイン設定及びSSL暗号化通信(HTTPS)に対応
    - AWS EC2
    - AWS S3
    - AWS Route53
    - ELB（ロードバランサー）
    - ACM (AWS Certificate Manager)
    - Nginx
    - Unicorn    

## 使用したGemの一部
- capistrano
- carrierwave
- devise
- dotenv-rails
- faker
- fog-aws
- google-api-client
- kaminari
- mini_magick
- omniauth
- omniauth-google-oauth2
- omniauth-twitter
- rspec-rails
- simple_calendar
- selenium-webdriver
- unicorn

## カタログ設計
https://docs.google.com/spreadsheets/d/1kW1E_9vfWvSI4gremHJSaXveBnxkVhreBCJPVDsd1IY/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1kW1E_9vfWvSI4gremHJSaXveBnxkVhreBCJPVDsd1IY/edit#gid=1729969543

## ER図
https://docs.google.com/spreadsheets/d/1kW1E_9vfWvSI4gremHJSaXveBnxkVhreBCJPVDsd1IY/edit#gid=1877687210
![ER](https://user-images.githubusercontent.com/11900792/58610196-9165cb80-82e5-11e9-8cb5-2bde3ac4b300.jpg)

## 画面遷移図
https://docs.google.com/spreadsheets/d/1kW1E_9vfWvSI4gremHJSaXveBnxkVhreBCJPVDsd1IY/edit#gid=773934517

## ワイヤーフレームワーク
https://docs.google.com/spreadsheets/d/1kW1E_9vfWvSI4gremHJSaXveBnxkVhreBCJPVDsd1IY/edit#gid=371446136

## Rspecテスト実行時のコマンド
gem 'spring-commands-rspec'を活用した実行環境を使うために、以下のコマンドを実行。  
※ `$ bundle exec rspec`でも実行可能

```
$ bundle exec spring binstub rspec
```
```
$ bin/rspec
```


