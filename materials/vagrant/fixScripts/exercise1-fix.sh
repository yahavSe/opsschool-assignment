#!/bin/bash
#add fix to exercise1 here
echo -e '      routes: \n      - to: default\n        via: 10.0.0.2' | sudo tee --append /etc/netplan/50-vagrant.yaml
sudo netplan apply
