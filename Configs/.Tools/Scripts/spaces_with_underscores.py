#! /usr/bin/python3
import os
import sys
import glob

filenames = sys.argv[0:]
for filename in filenames:
    processed_filename = filename.replace(' ', '_')
    os.rename(filename, processed_filename)
