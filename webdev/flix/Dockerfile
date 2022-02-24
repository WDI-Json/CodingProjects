# FASE 1
FROM ruby:3.0.2 as Builder  

ARG BUNDLE_WITHOUT="development test" 
ARG RAILS_ENV="production"

ENV BUNDLE_WITHOUT=${BUNDLE_WITHOUT}

RUN apt-get update && apt-get install -y \
  build-essential \
  postgresql-client \
  git \
  npm \
  tzdata \
  brotli \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs && npm install -g yarn

WORKDIR /home/app

# Install gems
RUN gem install libv8-node
ADD Gemfile* /home/app/
RUN bundle lock --add-platform x86_64-linux
RUN bundle config --global frozen 1 \
  && bundle install -j4 --retry 3 \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

###############################
# FASE 2
FROM ruby:3.0.2

RUN apt-get update && apt-get install -y \
  file \
  postgresql-client \
  tzdata \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs && npm install -g yarn

# Add user
RUN groupadd -r app && useradd -r -g app app

USER app

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/

USER root
RUN mkdir -p /home/app/tmp/pids && chown -R app:app /home/app/tmp
ADD --chown=app:app . /home/app
RUN chown -R app:app /home/app

RUN yarn install
RUN SECRET_KEY_BASE=ABCDEFGHIJKLMNOPQRSTUVWXYZ01234 \
    RAILS_ENV=production \
    bundle exec rails assets:precompile

# Set Rails env
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_ENV production

USER app
WORKDIR /home/app

# Start up
#CMD ["bundle", "exec", "rails", "db:migrate", "&&", "bundle", "exec", "puma"]
CMD ["sh", "-c", "bundle exec rails db:migrate; bundle exec puma"]

