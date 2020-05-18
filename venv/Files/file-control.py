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

for item in Path(dumppath).glob('*.gz'):
    if item.is_file():
        print(str(item.absolute()))
        itemTime = arrow.get(item.stat().st_mtime)
        if itemTime < twoweeks:
            shutil.move(item, archivpath)
            pass


for item in Path(dumppath).glob('*12_00_00.sql.gz'):
    if item.is_file():
        print(item.absolute())
        itemTime = arrow.get(item.stat().st_mtime)
        if itemTime > fourweeks:
            os.remove(item.absolute(), dir_fd=None)
        else:
            print("error")
