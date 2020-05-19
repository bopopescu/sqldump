import shutil
import glob
import os
import datetime
from pathlib import Path
import arrow

dumppath = "/home/alex/PycharmProjects/Datensicherung/Dumps/"
archivpath = "/home/alex/PycharmProjects/Datensicherung/Archiv/"

twoweeks = arrow.now().shift(hours=+5).shift(days=-14)
fourweeks = arrow.now().shift(hours=+5).shift(days=-14)


def archiv():
    for item in Path(dumppath).glob('*.gz'):
        if item.is_file():
            itemTime = arrow.get(item.stat().st_mtime)
            if itemTime > twoweeks:
                shutil.move(str(item.absolute()), archivpath)
                print(str(item.absolute()), "was archived")
                pass
            if itemTime < twoweeks:
                print(str(item.absolute()), "not old enough to archive...")


def delete():
    for item in Path(archivpath).glob('*'):  # eigentlich .glob('*12_00_00.sql.gz')
        if item.is_file():
            itemTime = arrow.get(item.stat().st_mtime)
            if itemTime > fourweeks:
                os.remove(str(item.absolute()), dir_fd=None)
                print(item.absolute(), "was deleted...")
            if itemTime < fourweeks:
                print(item.absolute(), "not old enough to delete...")


archiv()
delete()
