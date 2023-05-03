import mysql.connector
import pandas as pd
import numpy as np
from datetime import datetime
from sqlalchemy import create_engine
import warnings
warnings.filterwarnings('ignore', 'pandas')



db = mysql.connector.connect(
    user = 'root',
    host = 'localhost',
    password = 'root'
)

mycursor = db.cursor()

lecs = 'Agnes Njururi,Agnes Njururi,Margeret Chebet,Pius Muiru,Agnes Njururi,Margeret Chebet,'

lecs = lecs[:-1]

l = lecs.split(',')

l = list(set(l))

x = ''
for i in l:
    x += f'{i},'

l = x[:-1]
print(len(9781478611318))

