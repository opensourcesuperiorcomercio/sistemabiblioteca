const { PythonShell } = require('python-shell')

nombreTabla = ""

function setupBuscarBibliografia() {

    document.getElementById('tituloBuscador').innerHTML = 'Buscar bibliografia'
    nombreTabla = 'bibliografia'

    var dropDownColumnas = document.getElementById("dropDownColumnas");

    dropDownColumnas.innerHTML = ''

    let options = {
        args: [nombreTabla]
    }

    let buscarColumnasBibliografia = new PythonShell('pythons/obtenerNombresColumnas.py', options)

    buscarColumnasBibliografia.on('message', message => {

        respuesta = JSON.parse(message)

        limite = respuesta.length
        contador = 0
        while (contador < limite) {

            option = document.createElement("option");
            option.text = respuesta[contador][0]
            dropDownColumnas.appendChild(option);

            contador++

        }

    })

}

function setupBuscarUsuario() {
    document.getElementById('tituloBuscador').innerHTML = 'Buscar usuario'
    nombreTabla = 'usuariofinal'

    var dropDownColumnas = document.getElementById("dropDownColumnas");
    dropDownColumnas.innerHTML = ''

    let options = {
        args: [nombreTabla]
    }

    let buscarColumnasUsuarios = new PythonShell('pythons/obtenerNombresColumnas.py', options)

    buscarColumnasUsuarios.on('message', message => {

        respuesta = JSON.parse(message)

        limite = respuesta.length
        contador = 0
        while (contador < limite) {

            option = document.createElement("option");
            option.text = respuesta[contador][0]
            dropDownColumnas.appendChild(option);

            contador++

        }

    })

}

function actualizarFechaDevolucion() {
    campoFechaPrestamo = document.getElementById('fechaprestamo').value

    let options = {
        args: [campoFechaPrestamo]
    }

    let obtenerFecha = new PythonShell('pythons/procedimientoObtenerFecha.py', options)

    obtenerFecha.on('message', message => {

        console.log(message)
        document.getElementById('fechadevolucion').value = message

    })


}

function buscar(){

    campoBusqueda = document.getElementById("campoBusqueda").value
    igualATextoIngresado = document.getElementById("igualaTextoRadio").checked
    criterio = document.getElementById("dropDownColumnas").value

    let options = {
        args:[nombreTabla,campoBusqueda,igualATextoIngresado,criterio]
    }

    let busqueda = new PythonShell('procedimientoBusqueda.py',options)

    busqueda.on('message',message=>{

        console.log(message)

    })

}