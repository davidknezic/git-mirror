FROM alpine:3.3

ENV ORIGINAL_REPO "https://USER:PW@github.com/axa-ch/style-guide"
ENV MIRROR_REPO "https://USER:PW@example.com/mirrors/axa-ch/style-guide.git"
ENV CRON_STRING "*/5\t*\t*\t*\t*"

RUN apk add --update git \
  && rm -rf /var/cache/apk/*

COPY mirror.sh /usr/local/bin/mirror.sh
COPY crond-foreground.sh /usr/local/bin/crond-foreground.sh

WORKDIR /usr/local/bin
CMD ["./crond-foreground.sh"]
