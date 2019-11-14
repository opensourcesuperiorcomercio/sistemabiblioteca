const {PythonShell} = require('python-shell')

function mostrarMensaje(){

    let msj = document.getElementById('mensaje')

    if(msj.innerHTML=='')
       msj.innerHTML = 'Hola mundo'
    else
       msj.innerHTML = ''
    
}

function mostrarMensajePython(){

    let options = {
        mode: "text",
        scriptPath: "./",
        args: ["hello world"]
    }

    let test = new PythonShell('prueba.py',options)

    test.on('message', message => {
        let msg = document.getElementById('mensajePython')
        msg.innerHTML = message
        console.log(message)
    })

}

function buscarBibliografia(){

    param = document.getElementById('param').value

    let options = {
        mode: "text",
        scriptPath: "./",
        args: [param]
    }

    console.log(param)

    let consultaId = new PythonShell('prueba.py',options)

    consultaId.on('message',message=>{
        let respuesta = document.getElementById('mensajePython')
        respuesta.innerHTML = message
    })

}