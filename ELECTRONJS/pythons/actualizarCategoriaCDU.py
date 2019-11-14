import sys
import mysql.connector
import json

try:
    db = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

    cursor = db.cursor(buffered=True)
    query = "SELECT nombremateria from categoriacdu"

    cursor.execute(query)

    result = cursor.fetchall()

    print(json.dumps(result))

except:
    print(str(sys.exc_info()))