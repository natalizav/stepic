#!/bin/sh
mysql -u root < /home/box/web/init.sql
mysql -u root stepic < /home/box/web/db.sql
