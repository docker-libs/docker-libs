#!/bin/bash
name=vscodessh
ver=$1
build_date=`date +"%Y%m%d"`
if [ -z "${ver}" ] ;then
  ver=1.0.0
fi
echo ${ver}_${build_date}
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg VER=${ver} \
  --build-arg BUILD_DATE=${build_date} \
  --push \
  --tag sorc/${name}:${ver}_${build_date} \
  --tag sorc/${name}:${ver} \
  --tag sorc/${name}:latest .