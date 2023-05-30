# Builder image, produces a statically linked binary
FROM golang:1-alpine3.16 as node-build

RUN apk update && apk add bash make git gcc libstdc++ g++ musl-dev
RUN apk add --no-cache \
     --repository http://nl.alpinelinux.org/alpine/edge/community --allow-untrusted \
    leveldb-dev=1.22-r2

WORKDIR /src

ADD . ./

# RUN go test -mod=vendor -cover ./dkgnode ./logging ./pvss ./common ./tmabci

WORKDIR /src/cmd/dkgnode

RUN go build -mod=readonly


# final image
FROM alpine:3.16

RUN apk update && apk add ca-certificates --no-cache
RUN apk add --no-cache \
  --repository http://nl.alpinelinux.org/alpine/edge/community --allow-untrusted \
  leveldb=1.22-r2

RUN mkdir -p /torus

COPY --from=node-build /src/cmd/dkgnode/dkgnode /torus/dkgnode

EXPOSE 443 80 1080 26656 26657
VOLUME ["/torus", "/root/https"]
CMD ["/torus/dkgnode"]
