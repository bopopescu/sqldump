import gzip
import shutil
import glob
import os

#files = glob.glob("/home/alex/PycharmProjects/Datensicherung/Dumps/*.sql")
#latestfile = max(files, key=os.path.getctime)

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






