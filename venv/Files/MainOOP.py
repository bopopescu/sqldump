#!/usr/bin/python

import os
from connect import *
import mysql
import subprocess
import datetime
import time
import gzip
import shutil
from Compress import compressdump


now = datetime.datetime.now()


class Dump:
    # Class Attribute
    type = 'dumpfile'

    # Initializer / Instance Attributes
    def __init__(self, filename, timestamp, compression):
        self.filename = filename
        self.timestamp = timestamp
        self.compression = compression


InstantDump = Dump("baufuchs_db_", now.strftime("%Y-%m-%d_%H_%M"), True)

NoonDump = Dump("baufuchs_db_", now.strftime("%Y-%m-%d_12_00"), True)

EveDump = Dump("baufuchs_db_", now.strftime("%Y-%m-%d_20_00"), True)


def savedump(Dumptype):
    subprocess.run(
        'mysqldump --socket=/opt/lampp/var/mysql/mysql.sock -u root -p123 baufuchs > '
        '~/PycharmProjects/Datensicherung/Dumps/baufuchs_db_%s.sql' % Dumptype.timestamp,
        shell=True)
    print("Dump created!")


#while True:
 #   if now.hour == "12":
  #      savedump(NoonDump)
   # elif now.hour == "20":
    #    savedump(EveDump)

savedump(InstantDump)
compressdump()
