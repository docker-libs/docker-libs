#!/bin/bash
name=openclaw
ver=$1
if [ -z "${ver}" ] ;then
  ver=2026.3.28
fi
echo ${ver}_${build_date}
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg VER=${ver} \
  --push \
  --tag sorc/${name}:${ver} \
  --tag sorc/${name}:latest .

