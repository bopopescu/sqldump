import datetime
import time


def current_time():
    return datetime.datetime.now().strftime("%Y-%m-%d_%H_%M_%S")


while True:
    current_time()
    print(current_time())
    if datetime.datetime.now().strftime("%H_%M_%S") == '18_56_00':
        savedump(NoonDump)
        compressdump()
        time.sleep(10)
        continue
    elif datetime.datetime.now().strftime("%H_%M_%S") == '20_00_00':
        savedump(EveDump)
        compressdump()
        time.sleep(10)
        continue
    time.sleep(1)
