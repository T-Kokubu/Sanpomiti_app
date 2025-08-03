## :green_book:アプリケーションの概要
- 散歩コースやサイクリングコースについて総合的な情報サイトがないと思い、作成
- お気に入りの散歩コースを登録して共有できる、散歩コースが投稿できる情報総合サイト
  - （現在はアクセス不可）https://www.sanpomiti.net/

## :green_book:技術的ポイント  
- AWS EC2, RDS を用いた Rails 本番環境構築
- ALB による EC2 の冗長化
- AWS ACM で SSL 証明書を発行し、通信を SSL 化
- 独自ドメインを取得、使用
- Docker を用いた開発環境構築
- CircleCI による自動デプロイ、自動テスト
- master に Git push/merge すると CodeDeploy と CodePipline により本番環境にも反映
- RSpec で Model, Controller テスト記述
- Ajax を用いた非同期処理（お気に入り登録/未登録などの切り替え表示）
- Rubocop を使用したコード規約に沿った開発

## :green_book:アプリケーションの機能
- 作成した散歩コースを投稿
- ユーザー登録、編集機能
- ログイン、ログアウト、テストログイン機能
- 散歩コースの投稿, 編集, 削除機能
- 画像を正方形に整形して投稿（ CarrierWave を使用）
- 散歩コースのスポットに住所入力すると Google Map 表示（ gmaps4rails, geocorder ）
- 検索（ Ransack を使用）
- お気に入り登録( Ajax で非同期化)
- ページネーション機能

## :green_book:使用技術
- Ruby 2.5.8
- Ruby on Rails 5.2.6
- PostgreSQL 13.1
- Docker/Docker-compose
- CircleCI CI/CD
- Rubocop
- RSpec
- Google Maps API
- AWS
  - VPC
  - EC2
  - RDS
  - Route53
  - ALB
  - AWS ACM
  - CodeDeploy
  - CodePipline

## :green_book:AWSインフラ構成図  
<img width="791" alt="インフラ構成図" src="https://user-images.githubusercontent.com/48621700/124880796-9f7c8f00-e009-11eb-8589-8be5f9537955.png">
