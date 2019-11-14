import sys
import mysql.connector
from mysql.connector import Error
import json
from datetime import datetime

def to_unicode_or_bust(obj, encoding="latin1"):
    if isinstance(obj, basestring):
        if not isinstance(obj, unicode):
            obj=unicode(obj, encoding)
    return obj

def conversorFechas(o):
    if isinstance(o, datetime):
        return o.__str__()

nombreTabla = sys.argv[1]
campoBusqueda = sys.argv[2]
igualATextoIngresado = sys.argv[3]
criterio = sys.argv[4]

try:

    db = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')

    cursor = db.cursor(buffered=True)

    if igualATextoIngresado == 'true':

        cursor.execute("SELECT * from "+nombreTabla+" where "+criterio+" = '"+campoBusqueda+"'")
    
    else:

        cursor.execute("SELECT * from "+nombreTabla+" where "+criterio+" LIKE '%"+campoBusqueda+"%'")

    results = cursor.fetchall()

    print(json.dumps(results,ensure_ascii=False,default=conversorFechas))

except Error as e:
    print(e)