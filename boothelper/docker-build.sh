#!/bin/bash
name=boothelper
#openjdk:8u342-slim-bullseye 132.69MB

#openjdk:26-ea-11-slim 243.52 MB

#openjdk:26-ea-17-slim 245.96 MB

#openjdk:26-ea-21-slim 246.1 MB

#openjdk:26-ea-25-slim 248.11 MB

java_ver=$1
if [ -z "${java_ver}" ] ;then
  echo "please input java version, example: 26-ea-25-slim"
  exit 1
fi
build_date=$(date +"%Y%m%d")
full_version=${java_ver}-${build_date}
echo ${full_version}
export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg JAVA_VER=${java_ver} \
  --build-arg FULL_VERSION=${full_version} \
  --push \
  --tag sorc/${name}:${full_version} \
  --tag sorc/${name}:${java_ver} .