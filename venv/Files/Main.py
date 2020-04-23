#!/usr/bin/python

import os
import connect
import mysql
import subprocess  #
import time


# dumpdatabase = subprocess.run(["mysqldump", "--socket=/opt/lampp/var/mysql/mysql.sock", "-u", "root", "-p123"]["baufuchs", ">", "~/PycharmProjects/Datensicherung/Dumps/sicherung.sql"])
# dumpdatabase

def gettimestamp():
    timestamp = time.strftime('%Y-%m-%d-%I:%M')
    return timestamp


dump = subprocess.run(
    'mysqldump --socket=/opt/lampp/var/mysql/mysql.sock -u root -p123 baufuchs > '
    '~/PycharmProjects/Datensicherung/Dumps/baufuchs_db_$(date "+%b_%d_%Y_%H_%M_%S").sql',
    shell=True)

