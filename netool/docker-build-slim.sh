#!/bin/bash
name=netool
ver0=bookworm-20251117-slim
ver1=12-slim

export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
# docker login -u sorc
# docker login
# docker run --privileged --rm tonistiigi/binfmt --install all
# docker buildx create --use --name mybuilder
# docker buildx ls
#构建镜像
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg VER=${ver0} \
  --push \
  --tag sorc/${name}:${ver0} \
  --tag sorc/${name}:${ver1} \
  --tag sorc/${name}:latest .


