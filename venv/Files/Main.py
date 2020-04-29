#!/usr/bin/python

import os
import connect
import mysql
import subprocess
import datetime


def dump():
    subprocess.run(
        'mysqldump --socket=/opt/lampp/var/mysql/mysql.sock -u root -p123 baufuchs > '
        '~/PycharmProjects/Datensicherung/Dumps/baufuchs_db_$(date "+%b_%d_%Y_%H_%M").sql',
        shell=True)


print('Dump Service running...')

now = datetime.datetime.now()

while True:
    if now.hour == "20" or now.hour == "12":
        dump()


