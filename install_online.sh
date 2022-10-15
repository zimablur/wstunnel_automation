#!/bin/env bash

apt update

yes N | apt -qq -y install openssl nodejs python
npm install wstunnel
termux-fix-shebang ~/node_modules/.bin/wstunnel