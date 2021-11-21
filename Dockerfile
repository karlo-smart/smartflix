FROM ruby:2.7.1
ENV WORKDIR /app
WORKDIR $WORKDIR
COPY . $WORKDIR
RUN bundle install

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN yarn install --check-files

CMD rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0
