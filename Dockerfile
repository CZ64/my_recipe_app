FROM ruby:2.7.2

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /my_recipe_app

WORKDIR /my_recipe_app

ADD Gemfile /my_recipe_app/Gemfile
ADD Gemfile.lock /my_recipe_app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /my_recipe_app