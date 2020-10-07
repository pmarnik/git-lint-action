FROM ruby:latest
RUN gem install git-lint
COPY git-lint.yml /config/git-lint/configuration-default.yml
ENV CONFIG_FILE_LOCATION=/config/git-lint/configuration-default.yml
COPY /entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
