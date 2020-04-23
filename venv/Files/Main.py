#!/usr/bin/python

import os
import connect
import mysql
import subprocess


dumpdatabase = subprocess.run(["mysqldump", "--socket=/opt/lampp/var/mysql/mysql.sock", "-u", "root", "-p123", "baufuchs", "> sicherung.sql"])
dumpdatabase

#test = subprocess.run(["mysqldump", "-u", "root", "-p", "123", "--socket=/opt/lampp/var/mysql/mysql.sock", "baufuchs", ">", "sicherung.sql"])
#test