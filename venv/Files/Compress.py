#!/usr/bin/python3

import gzip
import shutil
import glob
import os


# files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*.sql")
# latestfile = max(files, key=os.path.getctime)
def lastnoondump():
    files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*12_00_00.sql.gz")
    latestnoonfile = max(files, key=os.path.getctime)
    return latestnoonfile


def lastevedump():
    files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*20_00_00.sql.gz")
    latestevefile = max(files, key=os.path.getctime)
    return latestevefile


def lastcompdump():
    files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*.sql.gz")
    latestcompfile = max(files, key=os.path.getctime)
    return latestcompfile


def lastdump():
    files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*.sql")
    latestfile = max(files, key=os.path.getctime)
    return latestfile


def compressdump():
    with open("%s" % lastdump(), 'rb') as f_in:
        with gzip.open("%s.gz" % lastdump(), 'wb') as f_out:
            shutil.copyfileobj(f_in, f_out)
        os.remove("%s" % lastdump())
    print("Dump compressed!")
