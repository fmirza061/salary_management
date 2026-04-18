FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  build-essential

WORKDIR /app

RUN gem install bundler rails

COPY . .

RUN bundle install || true