# docker-libs
```bash
# 登录dockerhub
docker login
# 安装多平台构建环境
docker run --privileged --rm tonistiigi/binfmt --install all
# 创键构建容器
docker buildx create --use --name mybuilder
# 查看现有构建容器
docker buildx ls

# 允许使用docker manifest命令 
# 启用docker buildx
export DOCKER_CLI_EXPERIMENTAL=enabled
# 启用BuildKit作为Docker镜像构建引擎 Docker 18.09+ 
export DOCKER_BUILDKIT=1
# Docker 20.10 不需要以上环境变量配置
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg VER=${ver} \
  --push \
  --tag sorc/${name}:${ver} \
  --tag sorc/${name}:${latest} .

# syntax = docker/dockerfile:1.4
# 旧版本：syntax = docker/dockerfile:experimental
# Dockerfile 语法版本：
# 1.0：基础功能
# 1.1：ARG 在 FROM 之前
# 1.2：新增 SHELL 功能
# 1.3：包含大多数实验性功能（推荐）
# 1.4：最新稳定版

# 目标操作系统，例如 linux、windows 等。
ARG TARGETOS
# 目标架构，例如 amd64、arm64、arm 等。
ARG TARGETARCH
# 目标平台，是操作系统和架构的组合，例如 linux/amd64、linux/arm64、windows/amd64 等。
ARG TARGETPLATFORM
# 构建主机的平台，如 linux/amd64
ARG BUILDPLATFORM  

# ------------------------- 例子 ---------------------------
# 定义平台参数
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH

# 第一阶段：交叉编译
FROM --platform=$BUILDPLATFORM golang:1.19 AS builder
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
WORKDIR /workspace
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# 设置交叉编译环境变量
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
    CGO_ENABLED=0 \
    go build -o /app/myapp ./cmd

# 第二阶段：最小化运行时镜像
FROM --platform=$TARGETPLATFORM gcr.io/distroless/static:nonroot
ARG TARGETPLATFORM
# 显示构建的是哪个平台
LABEL platform=$TARGETPLATFORM
# 复制二进制文件
COPY --from=builder /app/myapp /usr/local/bin/myapp
USER 65532:65532
ENTRYPOINT ["myapp"]
```