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
import argparse


def main():
    print()
    print("Hello", os.getlogin())
    print()
    print("This is a script to save dumps of the baufuchs database")
    print("For a list of commands, run this file with the parameter -h")
    print()
    print()


# now = datetime.datetime.now()


class Dump:
    # Class Attribute
    type = 'dumpfile'

    # Initializer / Instance Attributes
    def __init__(self, filename, timestamp, compression):
        self.filename = filename
        self.timestamp = timestamp
        self.compression = compression


def current_time():
    return datetime.datetime.now().strftime("%Y-%m-%d_%H_%M_%S")


InstantDump = Dump("baufuchs_db_", current_time(), True)

NoonDump = Dump("baufuchs_db_", datetime.datetime.now().strftime("%Y-%m-%d_12_00_%S"), True)

EveDump = Dump("baufuchs_db_", datetime.datetime.now().strftime("%Y-%m-%d_20_00_%S"), True)


def savedump(Dumptype):
    subprocess.run(
        'mysqldump --socket=/opt/lampp/var/mysql/mysql.sock -u root -p123 baufuchs > '
        '~/PycharmProjects/Datensicherung/Dumps/baufuchs_db_%s.sql' % Dumptype.timestamp,
        shell=True)
    print("Dump created!")


# while True:
#   if now.hour == "12":
#      savedump(NoonDump)
# elif now.hour == "20":
#    savedump(EveDump)

# savedump(InstantDump)
# compressdump()


parser = argparse.ArgumentParser(description='Managing dump program.')

# Adding optional arguments with descriptions
group = parser.add_mutually_exclusive_group()
group.add_argument("-start", action="store_true", help="Starts the program")
group.add_argument("-stop", action="store_true", help='Stops the program')
group.add_argument("-dump", action="store_true", help='Instantly creates a dump')
args = parser.parse_args()

main()
print("Enter command:")

# Implementing arguments
if __name__ == "__main__":
    while True:
        command = input()
        if args.start or command == "start":
            print("Program has started...")
            while True:
                command = input()
                if datetime.datetime.now().hour == "12":
                    savedump(NoonDump)
                    compressdump()
                elif datetime.datetime.now() == "20":
                    savedump(EveDump)
                    compressdump()
                elif args.stop or command == "stop":
                    print("Program has stopped...")
                    break
                elif args.dump or command == "dump":
                    savedump(InstantDump)
                    print(InstantDump.timestamp)
                    compressdump()
                    continue
