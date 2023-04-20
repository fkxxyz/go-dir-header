FROM alpine:latest

ARG ALPINE_VERSION=v3.16

RUN printf 'https://mirrors.cqu.edu.cn/alpine/%s/main\nhttps://mirrors.cqu.edu.cn/alpine/%s/community\nhttps://mirrors.ustc.edu.cn/alpine/edge/testing\n' "$ALPINE_VERSION" "$ALPINE_VERSION" | \
    install -Dm644 /dev/stdin /etc/apk/repositories
RUN apk update && apk upgrade

RUN apk add shared-mime-info

COPY /go-dir-header /go-dir-header

ENTRYPOINT [ "/go-dir-header" ]
