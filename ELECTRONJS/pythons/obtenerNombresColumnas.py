import sys
import mysql.connector
from mysql.connector import Error
import json
# SELECT `COLUMN_NAME` 
# FROM `INFORMATION_SCHEMA`.`COLUMNS` 
# WHERE `TABLE_SCHEMA`='yourdatabasename' 
#     AND `TABLE_NAME`='yourtablename';

nombreTabla = sys.argv[1]

try:

    db = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

    cursor = db.cursor(buffered=True)

    cursor.execute("SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='biblioteca' AND `TABLE_NAME`='"+nombreTabla+"';")

    results = json.dumps(cursor.fetchall())

    print(str(results))

except Error as e:
    print(e)
