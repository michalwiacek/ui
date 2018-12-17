FROM ruby:2.5.3-alpine3.7
LABEL maintainer="michal.wiacek.90@gmail.com"

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                postgresql-dev \
                                nodejs \
                                tzdata

ENV APP_PATH /usr/src/app

# Install Yarn
ENV PATH=/root/.yarn/bin:$PATH
RUN apk add --virtual build-yarn curl && \
    touch ~/.bashrc && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    apk del build-yarn

# Different layer for gems installation
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

# Copy the application into the container
COPY . APP_PATH
EXPOSE 3000