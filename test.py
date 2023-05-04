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

mycursor.execute('SELECT * FROM library.issued_books WHERE issue_id = 3;')
data = [i for i in mycursor][0]
user = data[3]
state = data[-2]

issue_id = data[0]
isbn = data[1]
book_name = data[2]
issue_date = data[5]
return_date = data[6]
status = data[-3]
penalty = data[-1]


print(status)















