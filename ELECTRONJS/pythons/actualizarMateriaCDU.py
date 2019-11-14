import sys
import mysql.connector
import json

try:
    nombreCategoria = sys.argv[1]

    db = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

    cursor = db.cursor(buffered=True)
    query = "SELECT nombremateria from materiacdu where numerocategoria = (SELECT numeromateria from categoriacdu where nombremateria = '"+nombreCategoria+"')"

    cursor.execute(query)

    result = cursor.fetchall()

    print(json.dumps(result))

except:
    print(str(sys.exc_info()))