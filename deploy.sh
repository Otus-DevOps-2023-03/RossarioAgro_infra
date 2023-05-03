#!/bin/bash

sudo apt update && sudo apt install -y git

cd ~/ && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
sudo lsof -i -P -n | grep LISTEN | grep ruby | awk '{print "App start with PID:"$2, "and port"$9}'
