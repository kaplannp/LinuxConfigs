#/home/kaplannp/anaconda3/envs/developer/bin/python

import os
import datetime
from sys import argv

if (len(argv) > 1):
    path = argv[1]
else:
    path = '.'
debug_filename = 'debug_log.txt'
filepath = os.path.join(path, debug_filename)

with open(filepath, 'a') as file:
    file.write("run at "+datetime.datetime.now().strftime("%M:%S")+"\n")
    
