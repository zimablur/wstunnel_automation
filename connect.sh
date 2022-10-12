#!/bin/env bash

wstunnel -c -t 1888:sshserver:2222 wss://$1:443