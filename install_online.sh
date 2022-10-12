#!/bin/env bash

apt update

yes N | apt -qq -y install openssl nodejs python
npm install -g wstunnel