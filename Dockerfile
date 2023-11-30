FROM ruby:3.2.2

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN mkdir -p $APP_ROOT && \
    apt-get update -y && \
    apt-get install build-essential libpq-dev nodejs vim npm -y && \
    npm install yarn -g -y && \
    yarn global add esbuild

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

COPY . $APP_ROOT/

# EXPOSE 3000
# CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0"]