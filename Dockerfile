FROM ruby:2.7.7-alpine

RUN apk upgrade # 20220403

COPY Gemfile* /app/

# Ruby code
RUN apk add libxml2 \
 && apk add -t .deps make patch gcc g++ musl-dev libxml2-dev \
 && cd /app \
 && bundle config set no-cache true \
 && bundle install \
 && apk del .deps \
 && rm -f /var/cache/apk/*

COPY files/. /

# Other tools
RUN apk add nginx fcgiwrap git \
 && mkdir -p /run/nginx \
 && ( [ ! -e /etc/nginx/conf.d/default.conf ] || mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled ) \
 && rm -f /var/cache/apk/*

VOLUME /source /site

ENTRYPOINT ["/entrypoint"]
CMD ["/startup"]
