import sys
import hashlib
import mysql.connector
from mysql.connector import Error

if __name__ == "__main__":
    
    nombreUsuario = sys.argv[1]
    password = sys.argv[2]

    try:
        
        connection = mysql.connector.connect(host='localhost',database='biblioteca',user='root',password='')
    
        if connection.is_connected():
            
            hash_object = hashlib.sha256(password.encode('utf-8'))
            passHasheada = hash_object.hexdigest()

            query1 = "Select id from usuariosdesistema where nombreDeUsuario = '"+nombreUsuario+"' "
            query2 = "and password = '"+passHasheada+"'"

            query = query1+query2

            cursor = connection.cursor()
            cursor.execute(query)

            resultado = cursor.fetchone()

            if(resultado):
                resultado = resultado[0]
                respuesta = str(resultado)
                print(respuesta)
            else:
                print('incorrecto')

    except Error as e:
        print(e)
        print("fallo_conexion")