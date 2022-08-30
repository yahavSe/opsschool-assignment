#!/bin/bash
#add fix to exercise4-server1 here
sudo touch /etc/ssh/ssh_config.d/host-ssh.conf
sudo echo -e 'Host server2\n\tHostname 192.168.60.11' | sudo tee /etc/ssh/ssh_config.d/host-ssh.conf
sudo systemctl restart ssh
sudo sed -i '/^PasswordAuthentication/ s/no/yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo sed -i 's/HashKnownHosts yes/HashKnownHosts no/' /etc/ssh/ssh_config

sudo systemctl restart ssh

sudo apt-get update

sudo apt-get install sshpass -y

ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
sudo chown vagrant /home/vagrant/.ssh/id_rsa

sudo chown vagrant /home/vagrant/.ssh/id_rsa.pub

#sudo apt-get install sshpass -y
#sshpass -f 'vagrant' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub server2 -p 22
