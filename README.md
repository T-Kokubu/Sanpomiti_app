## :green_book:アプリケーションの概要  
・散歩コースやサイクリングコースについて総合的な情報サイトがないと思い、作成しました。  
・お気に入りの散歩コースを登録して共有できる、散歩コースが投稿できる情報総合サイト。https://www.sanpomiti.net/  

## :green_book:技術的ポイント  
・AWS　EC2/RDSを用いたRails本番環境構築  
・ALBによるEC2の冗長化  
・AWS　ACMでSSL証明書を発行し、SSL化  
・独自ドメインを取得、使用  
・Dockerを用いた開発環境構築  
・CircleCIによる自動デプロイ、自動テスト  
・masterにGit push/mergeするとCodeDeployとCodePiplineにより本番環境にも反映  
・RSpecでModel, Controllerテスト記述  
・Ajaxを用いた非同期処理（お気に入り登録/未登録などの切り替え表示）  
・Rubocopを使用したコード規約に沿った開発  


## :green_book:アプリケーションの機能  
・作成した散歩コースを投稿  
・ユーザー登録、編集機能  
・ログイン、ログアウト、テストログイン機能  
・散歩コースの投稿, 編集, 削除機能  
・画像を正方形に整形して投稿（CarrierWaveを使用）    
・散歩コースのスポットに住所入力すると Google Map表示（gmaps4rails,geocorder)  
・検索（Ransackを使用）  
・お気に入り登録(Ajaxで非同期化)  
・ページネーション機能   

## :green_book:使用技術  
・Ruby 2.5.8  
・Ruby on Rails 5.2.6  
・PostgreSQL 13.1  
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
   ●AWS ACM  
   ●CodeDeploy  
   ●CodePipline  

## :green_book:AWSインフラ構成図  
<img width="791" alt="インフラ構成図" src="https://user-images.githubusercontent.com/48621700/124880796-9f7c8f00-e009-11eb-8589-8be5f9537955.png">
