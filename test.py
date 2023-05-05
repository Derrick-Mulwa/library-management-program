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

querry1 = 'SELECT * FROM library.return_request WHERE return_id = %s;'
querry2 = 'UPDATE  library.issued_books SET returned = "YES", actual_return_date = %s WHERE issue_id = %s'
querry3 = 'DELETE FROM library.return_request WHERE return_id = %s;'
now = datetime.now().date()
id = 3

mycursor.execute(querry1, (id,))
request_details = [i for i in mycursor][0]
issue_id = request_details[2]
book = request_details[4]

mycursor.execute(querry2, (now, issue_id))
db.commit()
mycursor.execute(querry3, (id,))
db.commit()
print(request_details)



print(now)














