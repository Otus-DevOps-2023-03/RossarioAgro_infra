#!/bin/bash

chmod -R +x ~/install_scripts/* && \
~/install_scripts/install_ruby.sh && \
~/install_scripts/install_mongodb.sh && \
~/install_scripts/deploy.sh
