#!/bin/bash
# 文件名：deploy_frontend.sh
# 用法：bash deploy_frontend.sh

set -e

PROJECT_DIR="/root/codebase/MyWebsite/frontend"
DEPLOY_DIR="/var/www/html"

echo "==> 进入前端目录"
cd $PROJECT_DIR

echo "==> 安装依赖"
npm install

echo "==> 打包 Vue 前端"
npm run build

echo "==> 清理旧版本"
sudo rm -rf $DEPLOY_DIR/*

echo "==> 拷贝新版本到 Nginx 目录"
sudo cp -r dist/* $DEPLOY_DIR/

echo "==> 设置权限"
sudo chown -R www-data:www-data $DEPLOY_DIR

echo "==> 部署完成，可以通过 http://服务器IP 访问"
