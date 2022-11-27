FROM alpine:3.17

LABEL "name"="Bugsnag Build Reporting"
LABEL "maintainer"="Sachin Pande <sazap10@gmail.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Bugsnag build reporting"
LABEL "com.github.actions.description"="Reports application build to Bugsnag"
LABEL "com.github.actions.icon"="send"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/sazap10/bugsnag-builds-action"
LABEL "homepage"="https://github.com/sazap10/bugsnag-builds-action"

RUN apk add curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
