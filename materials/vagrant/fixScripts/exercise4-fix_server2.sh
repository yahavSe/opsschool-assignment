#!/bin/bash
#!/usr/bin/expect -f
#add fix to exercise4-server2 here

sudo touch /etc/ssh/ssh_config.d/host-ssh.conf
sudo echo -e 'Host server1\n\tHostname 192.168.60.10' | sudo tee /etc/ssh/ssh_config.d/host-ssh.conf
sudo systemctl restart ssh
#create config ssh file to Host settings with server name and ip.
#sudo touch /home/vagrant/.ssh/config
#sudo echo -e 'Host server1\n\tHostname 192.168.60.10' | sudo tee /home/vagrant/.ssh/config

#change the sshd_config PasswordAuthentication to yes.
sudo sed -i '/^PasswordAuthentication/ s/no/yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo apt-get update

sudo apt-get install sshpass -y

ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

sudo sed -i 's/#   ForwardAgent no/StrictHostKeyChecking no/' /etc/ssh/ssh_config

sudo chown vagrant /home/vagrant/.ssh/id_rsa

sudo chown vagrant /home/vagrant/.ssh/id_rsa.pub

sudo chmod 600 /home/vagrant/.ssh/id_rca.pub

sudo sed -i 's/HashKnownHosts yes/HashKnownHosts no/' /etc/ssh/ssh_config

sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.60.10

sleep 10
ssh server1 | ssh-copy-id server2 | sshpass -p 'vagrant'

#ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.60.11 | sshpass -p 'vagrant' ssh -tt vagrant@192.168.60.10 ssh vagrant@192.168.60.11 
