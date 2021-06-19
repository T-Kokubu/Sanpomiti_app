# アプリケーションの概要
お気に入りの散歩コースを登録して共有できる、散歩コース投稿のSNSサービス。https://www.sanpomiti.net/

# 技術的ポイント
・AWS　EC2/RDSを用いたRails本番環境構築
・ALBによるEC2の冗長化
・AWS　ACMでSSL証明書を発行し、SSL化
・独自ドメインを取得、使用
・Dockerを用いた開発環境構築
・CircleCIによる自動デプロイ、自動テスト
・Git pushするとCodeDeployとCodePiplineにより本番環境にも反映
・RSpecでModel, Controllerテスト記述
・Ajaxを用いた非同期処理（お気に入り登録/未登録などの切り替え表示）
・Rubocopを使用したコード規約に沿った開発


# アプリケーションの機能
・作成した散歩コースを投稿  
・ユーザー登録、ログイン
・画像を正方形に整形して投稿（CarrierWaveを使用）  
・散歩コースのスポットに住所入力すると Google Map表示（gmaps4rails,geocorder)
・検索（Ransackを使用）
・お気に入り登録
・モデルに対するバリデーション  

# 使用技術
・Ruby 2.5.8
・Ruby on Rails 5.2.4
・PostgreSQL
・Docker/Docker-compose
・CircleCI CI/CD
・Rubocop
・RSpec
・Google Maps API
・AWS
  ●VPC
  ●EC2
  ●RDS
  ●Route53
  ●ALB
  ●Code Deploy
  ●Code Pipline
  ●AWS ACM
