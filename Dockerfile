FROM ruby:latest
#FROM ubuntu:latest
RUN gem install git-lint
COPY /entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
COPY config.yml /config/git-lint/configuration.yml
ENV XDG_CONFIG_DIRS=/config
WORKDIR /repo
