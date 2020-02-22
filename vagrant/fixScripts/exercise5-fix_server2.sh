#!/bin/bash
#add fix to exercise5-server2 here
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys
sudo apt-get update
sudo apt-get install sshpass
cat /home/vagrant/.ssh/id_rsa.pub | sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.100.10 "cat >> /home/vagrant/.ssh/authorized_keys && ssh-keyscan -t rsa 192.168.100.11,server2 >> ~/.ssh/known_hosts"
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@192.168.100.10:/home/vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
cat /home/vagrant/.ssh/id_rsa.pub >>  /home/vagrant/.ssh/authorized_keys
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.100.10 "rm -f /home/vagrant/.ssh/id_rsa.pub"
ssh-keyscan -t rsa 192.168.100.10,server1 >> /home/vagrant/.ssh/known_hosts
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/
rm -f /home/vagrant/.ssh/id_rsa.pub