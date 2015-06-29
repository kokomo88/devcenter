FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /app

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /app
CMD bundle exec middleman
