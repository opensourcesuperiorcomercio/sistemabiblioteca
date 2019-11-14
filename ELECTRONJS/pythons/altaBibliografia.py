import sys

import mysql.connector
from mysql.connector import Error
from datetime import datetime

if __name__ == "__main__":
    titulo = sys.argv[1]
    autores = sys.argv[2]
    anioPublicacion = sys.argv[3]
    editorial = sys.argv[4]
    ISBN = sys.argv[5]
    descripcion = sys.argv[6]
    edicion = sys.argv[7]
    lugarImpresion = sys.argv[8]

    try:
        connection = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')
    
        if connection.is_connected():

            query1 = "insert into bibliografia (fechaAlta, fechaBaja, idEstado, titulo, autores, "
            query2 = "anioPublicacion, idEditorial, ISBN, descripcion,tejuelo, idCategoriaCDU, "
            query3 = "idMateriaCDU, idSubmateriaCDU, edicion, lugarImpresion) values ('"
            query4 = str(datetime.today())+"', '1900-01-01', '1', '"+titulo+"', '"+autores+"', '"+anioPublicacion
            query5 = "', '1','"+ISBN+"', '"+descripcion+"','1','1','1','1', '"+edicion+"', '"+lugarImpresion+"')"

            query = query1+query2+query3+query4+query5
            cursor = connection.cursor()
            cursor.execute(query)
            connection.commit()
            print("La bibliografia "+titulo+" fue almacenada con exito")

    except Error as e:
        print(e)
