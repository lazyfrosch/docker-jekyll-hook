FROM nginx:alpine

ENV JEKYLL_VERSION=3.8.5

RUN apk update \
 && apk add build-base fcgiwrap git libffi libffi-dev ruby ruby-bundler ruby-dev ruby-json \
 && gem install --clear-sources --no-document --no-rdoc jekyll -v "~> ${JEKYLL_VERSION}" \
 && gem install --clear-sources --no-document --no-rdoc bigdecimal public_suffix \
 && mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled \
 && rm -f /var/cache/apk/*

COPY files/. /

VOLUME /source /site

ENTRYPOINT ["/entrypoint"]
CMD ["/startup"]
