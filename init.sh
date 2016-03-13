#!/bin/sh

sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/django.conf /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
git config --global user.email "natalizav@mail.ru"
git config --global user.name "natalizav"

