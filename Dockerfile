FROM ruby:2.5.8
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /sanpomiti_app
WORKDIR /sanpomiti_app
COPY Gemfile /sanpomiti_app/Gemfile
# COPY Gemfile.lock /sanpomiti_app/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /sanpomiti_app

# ローカルのファイルをコンテナへコピー
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# 一番最初に実行するコマンド
ENTRYPOINT ["entrypoint.sh"]
# コンテナがリッスンするport番号
EXPOSE 3000

# イメージ内部のソフトウェア実行
CMD ["rails", "server", "-b", "0.0.0.0"]
