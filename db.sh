#!/bin/sh
mysql -u root < /home/box/web/init.sql
mysql -u root < /home/box/web/db.sql
