import sys
from datetime import datetime
from datetime import timedelta

stringFecha = sys.argv[1]

stringYear = stringFecha[0:4]
stringMes = stringFecha[5:7]
stringDia = stringFecha[8:10]

fechaResultado = datetime(int(stringYear),int(stringMes),int(stringDia))

fechaResultado = fechaResultado + timedelta(days=15)

stringFechaResultado = str(fechaResultado)[0:10]

print(str(stringFechaResultado))

# YYYY-MM-DD