#!/bin/bash
#add fix to exercise3 here
sudo sed -i 's/deny from all/allow from all/g' /etc/apache2/sites-available/default
sudo sed -i 's/world/from OpsSchool/' /var/www/index.html
sudo /etc/init.d/apache2 restart