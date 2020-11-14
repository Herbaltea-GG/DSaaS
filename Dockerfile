FROM debian:buster-slim
ARG DATE
ARG RELEASE=1.29.0
ADD https://github.com/sass/dart-sass/releases/download/${RELEASE}/dart-sass-${RELEASE}-linux-x64.tar.gz /opt/
RUN tar -C /opt/ -xzvf /opt/dart-sass-${RELEASE}-linux-x64.tar.gz
RUN mkdir /sass && \
    chmod 755 -R /sass

LABEL maintainer="adam@quitenice.ca" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$DATE \
      org.label-schema.vendor="Adam P" \
      org.label-schama.name="herbaltea/dsaas" \
      org.label-schema.description="dart-sass as a service. Runs a vm that quickly ingests/compiles scss and then disappears." \
      org.label-schema.url="https://hub.docker.com/r/herbaltea/dsaas" \
      org.label-schema.docker.cmd="docker run --rm -v $PWD/sass:/sass herbaltea/dsaas:latest" \
      org.label-schema.version="1.0.0" \
      org.label-schema.vcs-url="https://github.com/Herbaltea-GG/DSaaS" \
      org.label-schema.vcs-branch="master" 

CMD [ "/opt/dart-sass/sass", "/sass/ingress:/sass/compiled" ]
