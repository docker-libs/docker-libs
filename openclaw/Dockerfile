# syntax = docker/dockerfile:experimental
FROM ghcr.io/openclaw/openclaw:2026.3.28
USER root
# 1. 安装系统依赖：jq, sqlite3, curl 等
RUN apt-get update && apt-get install -y --no-install-recommends \
 jq \
 sqlite3 \
 curl \
 build-essential \
 python3 \
 && rm -rf /var/lib/apt/lists/*
# 2. 安装QMD
RUN npm install -g @tobilu/qmd --ignore-scripts && \
    npm install -g @tobilu/qmd --ignore-scripts && \
    cd /usr/local/lib/node_modules/@tobilu/qmd && \
    npm rebuild better-sqlite3 && \
    chown -R node:node /usr/local/lib/node_modules/@tobilu/qmd

# 切换回默认的 node 用户
USER node


 

