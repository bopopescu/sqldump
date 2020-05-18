#!/usr/bin/python

import os
from connect import *
import mysql
import subprocess
import datetime
import time
#import gzip
#import shutil
from Compress import compressdump
import argparse


def current_time():
    return datetime.datetime.now().strftime("%Y-%m-%d_%H_%M_%S")


class Dump:
    # Class Attribute
    type = 'dumpfile'

    # Initializer / Instance Attributes
    def __init__(self, filename, timestamp, compression):
        self.filename = filename
        self.timestamp = timestamp
        self.compression = compression


InstantDump = Dump("baufuchs_db_", current_time(), True)

NoonDump = Dump("baufuchs_db_", datetime.datetime.now().strftime("%Y-%m-%d_12_00_00"), True)

EveDump = Dump("baufuchs_db_", datetime.datetime.now().strftime("%Y-%m-%d_20_00_00"), True)


def savedump(Dumptype):
    subprocess.run(
        'mysqldump --socket=/opt/lampp/var/mysql/mysql.sock -u root -p123 baufuchs > '
        '~/PycharmProjects/Datensicherung/Dumps/baufuchs_db_%s.sql' % Dumptype.timestamp,
        shell=True, capture_output=False)
    print("Dump created!")


# Implementing arguments
if __name__ == "__main__":
    while True:
        while True:
            time.sleep(1)
            if datetime.datetime.now().strftime("%H_%M_%S") == '19_40_00':
                print(current_time())
                savedump(NoonDump)
                compressdump()
                continue
            elif datetime.datetime.now().strftime("%H_%M_%S") == '20_00_00':
                print(current_time())
                savedump(EveDump)
                compressdump()
                continue

