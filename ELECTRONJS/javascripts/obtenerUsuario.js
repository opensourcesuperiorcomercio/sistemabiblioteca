const remote = require('electron').remote

var diasDeLaSemana ={
    0: "Domingo",
    1: "Lunes",
    2: "Martes",
    3: "Miércoles",
    4: "Jueves",
    5: "Viernes",
    6: "Sábado"
}

var meses ={
    0: "Enero",
    1: "Febrero",
    2: "Marzo",
    3: "Abril",
    4: "Mayo",
    5: "Junio",
    6: "Julio",
    7: "Agosto",
    8: "Septiembre",
    9: "Octubre",
    10: "Noviembre",
    11: "Diciembre"
}

function setNombreUsuario() {
    console.log("el nombre de usuario es " + remote.getGlobal('user').nombre)
    console.log("y su id es " + remote.getGlobal('user').id)

    remote.getGlobal('ventana').show()

    document.getElementById('nombreDeUsuario').innerHTML =  "usuario: "+remote.getGlobal('user').nombre.toUpperCase()
    
    let fecha = new Date()
    
    document.getElementById('fechaDeHoy').innerHTML = diasDeLaSemana[fecha.getDay()] + " " + fecha.getDate() + " de " +meses[fecha.getMonth()] + " de " + fecha.getFullYear() 
}