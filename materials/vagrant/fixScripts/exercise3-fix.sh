#!/bin/bash
#add fix to exercise3 here
#The text in the website is: "hello world".
sudo sed -i -e '33s/^/# /' /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2
