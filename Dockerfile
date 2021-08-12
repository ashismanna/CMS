
FROM ruby:2.7.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY Gemfile /app/
ONBUILD COPY Gemfile.lock /app/
ONBUILD RUN bundle install

ONBUILD COPY . /app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y git curl libmcrypt-dev default-mysql-client && rm -rf /var/lib/apt/lists/*
RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]