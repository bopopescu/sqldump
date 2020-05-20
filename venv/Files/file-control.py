#!/usr/bin/python3

import shutil
import glob
import os
import datetime
from pathlib import Path
import arrow
import logging
import time


logging.basicConfig(filename='app.log', format='%(asctime)s - %(levelname)s - %(message)s', level=logging.NOTSET)


dumppath = "/home/alex/PycharmProjects/Datensicherung/Dumps/"
archivpath = "/home/alex/PycharmProjects/Datensicherung/Archiv/"

twoweeks = arrow.now().shift(hours=+5).shift(days=-14)
fourweeks = arrow.now().shift(hours=+5).shift(days=-14)


def main():
    print("File control system was started...")
    logging.info("File control system was started...")


def archiv():
    for item in Path(dumppath).glob('*.gz'):
        if item.is_file():
            itemTime = arrow.get(item.stat().st_mtime)
            if itemTime > twoweeks:
                shutil.move(str(item.absolute()), archivpath)
                print(str(item.absolute()), "was archived")
                logging.info("%s was archived", str(item.absolute()))
                pass
            if itemTime < twoweeks:
                print(str(item.absolute()), "not old enough to archive...")
                logging.info("%s is not old enough to archive...", str(item.absolute()))


def delete():
    for item in Path(archivpath).glob('*.gz'):  # eigentlich .glob('*12_00_00.sql.gz')
        if item.is_file():
            itemTime = arrow.get(item.stat().st_mtime)
            if itemTime > fourweeks:
                os.remove(str(item.absolute()), dir_fd=None)
                print(item.absolute(), "was deleted...")
                logging.info("%s was deleted...", str(item.absolute()))
            if itemTime < fourweeks:
                print(item.absolute(), " is not old enough to delete...")
                logging.info("%s is not old enough to delete...", str(item.absolute()))


main()


if __name__ == "__main__":
    while True:
        delete()
        archiv()
        time.sleep(10)
