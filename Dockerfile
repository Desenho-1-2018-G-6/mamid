FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /ecommerce-backend

WORKDIR /ecommerce-backend

COPY Gemfile /ecommerce-backend/Gemfile
COPY Gemfile.lock /ecommerce-backend/Gemfile.lock

RUN bundle install

COPY . /ecommerce-backend