#!/usr/bin/python

import os
from connect import *
import mysql
import subprocess
import datetime
import time
# import gzip
# import shutil
from Compress import compressdump
import argparse
import threading
import process


def main():
    print()
    print("Hello", os.getlogin())
    print()
    print("This is a script to save dumps of the baufuchs database")
    print("For a list of commands, run this file with the parameter -h")
    print()
    print()


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
        shell=True)
    print("Dump created!")


parser = argparse.ArgumentParser(description='Managing dump program.')

# Adding optional arguments with descriptions
group = parser.add_mutually_exclusive_group()
group.add_argument("-start", action="store_true", help="Starts the program")
group.add_argument("-stop", action="store_true", help='Stops the program')
group.add_argument("-dump", action="store_true", help='Instantly creates a dump')
args = parser.parse_args()

main()
print("Enter command:")


def dumploop():
    command = input()
    if args.stop or command == "stop":
        print("Program has stopped...")
    elif args.dump or command == "dump":
        InstantDump = Dump("baufuchs_db_", current_time(), True)
        savedump(InstantDump)
        print(InstantDump.timestamp)
        compressdump()


def autodump():
    command = input()
    if args.start or command == "start":
        print("Program has started... automatic dumps are created at 12:00 and 20:00.")
        while True:
            current_time()
            print(current_time())
            if datetime.datetime.now().strftime("%H_%M_%S") == '13_23_00':
                savedump(NoonDump)
                compressdump()
                time.sleep(10)
                continue
            elif datetime.datetime.now().hour == "20" and datetime.datetime.now().minute == "00" \
                    and datetime.datetime.now().second == "00":
                savedump(EveDump)
                compressdump()
                time.sleep(10)
                continue
            time.sleep(1)


dumploop()
