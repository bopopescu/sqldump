#!/usr/bin/python

import os
import connect
import mysql
import subprocess

connect.con()

# subprocess.run("mysqldump -u %s -p%s -h %s %s | gzip -c >> %s.gz" %
#               ("root", "", "localhost",
#                "baufuchs", "dump_baufuchs"))

# subprocess.run("mysqldump -u root -p --all-databases > sicherung.sql")
# subprocess.run("cd /var/lib/mysql", "ls")

dumpdatabase = subprocess.run(["mysqldump", "-u root", "-p --all-databases", ">", "sicherung.sql"])
dumpdatabase
