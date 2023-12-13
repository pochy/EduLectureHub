# ベースイメージの指定
FROM ruby:3.2.2 as base
WORKDIR /app

# パッケージのインストール
FROM base as bundle
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install


# 最終的に使用するイメージ
FROM bundle as main
COPY . .

# CMD実行前にentrypoint.shを通す
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# 開発用サーバーの実行
CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["/bin/bash"]