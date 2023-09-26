#! /home/kaplannp/anaconda3/envs/developer/bin/python
import webbrowser as webb
import pandas as pd
from sys import argv
import sys
import os

ROOT_PATH = sys.path[0]
file_path = os.path.join(ROOT_PATH, "MetaData/zoom_links.tsv")

X = pd.read_csv(file_path, '\t', index_col="Class_Name")
try:
    webb.open(X.loc[argv[1]][0])
except IndexError:
    print("Error. No ClassName identifier supplied")

