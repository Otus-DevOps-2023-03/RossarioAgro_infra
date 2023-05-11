#!/bin/bash

yc compute instance create --name reddit-app \
    --name reddit-app \
    --hostname reddit-app \
    --memory=4 --cores=2 --core-fraction=5 \
    --create-boot-disk image-id=fd8862e2tmhkgougrg6p,size=10GB \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --ssh-key ~/.ssh/appuser.pub
