import sys

import mysql.connector
from mysql.connector import Error

if __name__ == "__main__":

    idBibliografia = sys.argv[1]

    print(idBibliografia)

    try:
        connection = mysql.connector.connect(host='localhost',database='pruebapython',user='root',password='')
    
        if connection.is_connected():
            query = "select titulo from bibliografia where id = "+str(idBibliografia)
            cursor = connection.cursor()
            cursor.execute(query)

            result = cursor.fetchall()

            for row in result:
                print(row[0])

    except Error as e:
        print("No existe una bilbiografia con ese ID", e)
    