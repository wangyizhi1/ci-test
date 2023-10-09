CGO_ENABLED:=0
GOOS?=linux
GOARCH?=amd64
VERSION?=1.0.0
REGISTRY?="ghcr.io/wangyizhi1"
BINARY:=citest

.PHONY: binary
binary:
	CGO_ENABLED=$(CGO_ENABLED) GOOS=${GOOS} GOARCH=${GOARCH} go build -v -o $(BINARY)

.PHONY: image
image: binary
	set -e;\
    docker buildx build --output=type=docker --platform ${GOOS}/${GOARCH} --tag ${REGISTRY}/citest:v${VERSION} .
