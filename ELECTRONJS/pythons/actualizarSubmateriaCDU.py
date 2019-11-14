
# -*- coding: 850 -*-
# -*- coding: utf-8 -*-
import sys
import mysql.connector
import json


try:
    nombreMateria = sys.argv[1]
    db = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

    cursor = db.cursor(buffered=True)
    query = "SELECT nombresubmateria from submateriacdu where numeromateria = (SELECT numeromateria from materiacdu where nombremateria LIKE '"+nombreMateria+"%')"

    print(query)

    cursor.execute(query)

    result = cursor.fetchall()

    # print(json.dumps(result))

except:
    print(str(sys.exc_info()))