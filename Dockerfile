FROM ruby:2.4.7
LABEL description="Ruby image with Chrome and Chromedriver"
LABEL version="2.4.7"
MAINTAINER Shalva Usubov <joaom.dev@hotmail.com>

# Install Chrome
RUN set -ex \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
        >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Chromedriver
RUN set -ex \
    && cd /tmp \
    && wget -Nv https://chromedriver.storage.googleapis.com/83.0.4103.14/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && chmod -v +x chromedriver \
    && mv -v chromedriver /usr/local/bin/ \
    && rm -v chromedriver_linux64.zip
