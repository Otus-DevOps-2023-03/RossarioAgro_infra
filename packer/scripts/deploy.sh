#!/bin/bash

sudo apt install -y git

cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd /home/appuser/reddit && bundle install

sudo echo -e "[Unit]\nDescription=Puma Webserver\nWants=network-online.target\nAfter=network.target network-online.target\n\n[Service]\nType=simple\nUser=appuser\nWorkingDirectory=/home/appuser/reddit\nExecStart=/usr/local/bin/puma\n\nTimeoutSec=15\nRestart=always\nKillMode=process\n\n[Install]\nWantedBy=multi-user.target" > /tmp/puma.service

sudo mv /tmp/puma.service /etc/systemd/system
sudo chmod 755 /etc/systemd/system/puma.service

sudo systemctl daemon-reload
sudo systemctl enable --now puma.service
