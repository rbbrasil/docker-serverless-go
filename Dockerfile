FROM golang:1.18-stretch

ENV SERVERLESS serverless@3.22.0
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN curl --silent --location https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm install -g $SERVERLESS \
    apt-get -q -y clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
    mkdir -p /.cache/go-build