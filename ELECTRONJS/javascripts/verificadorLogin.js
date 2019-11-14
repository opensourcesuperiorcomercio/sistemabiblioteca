const {PythonShell} = require('python-shell')
const ventanaPrincipal = require('../index') 
var path = require('path')

function loguearConEnter(){

    if(event.key == 'Enter')
        verificarAcceso()

}

function verificarAcceso(){

    nombreUsuario = document.getElementById('usuario').value
    password = document.getElementById('pass').value
    loginFallido = document.getElementById('mensajeLoginFallido')

    var options = {
        args: [nombreUsuario,password]
    }

    let login = new PythonShell('pythons/procedimientoLogin.py',options)

    login.on('message', message => {
        
        const remote = require('electron').remote

        console.log(message)

        if(message == "None" || isNaN(message)){

            if(message == "fallo_conexion"){
                loginFallido.innerHTML = "No se pudo conectar a MySQL"
            }

            loginFallido.className = "alert alert-danger mt-2"

        }

        else{

            remote.getGlobal('user').nombre = nombreUsuario
            remote.getGlobal('user').id = message

            console.log(path)

            let ancho = 1000
            let alto = 800

            remote.getGlobal('ventana').hide()

            remote.getGlobal('ventana').setSize(ancho,alto)
            remote.getGlobal('ventana').setPosition((window.screen.width-ancho)/2  ,20+(window.screen.height-alto)/2)

            //window.location = '/htmls/principal.html'
            directorioHTML = window.location.pathname.replace("index.html","")

            window.location = directorioHTML+"principal.html"

            window.nombre = nombreUsuario
        }

    })

}