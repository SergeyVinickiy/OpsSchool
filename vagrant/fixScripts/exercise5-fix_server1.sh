#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/
chmod 600 ~/.ssh/authorized_keys