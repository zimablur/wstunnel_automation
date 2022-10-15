#!/bin/env bash

curl -L -o wstunnel_offline_assets.zip https://github.com/zimablur/wstunnel_offline_assets/archive/refs/heads/master.zip
unzip wstunnel_offline_assets.zip
cd wstunnel_offline_assets

tar -xzvf termux_packages_android.tar.gz
tar -xzvf wstunnel_android.tar.gz

cd termux_packages_android
dpkg -i *.deb

cd ../wstunnel
mv node_modules ~/