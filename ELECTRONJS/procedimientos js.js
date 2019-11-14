

function verificarCampoConsulta() {

    botonConsultarActividad = document.getElementById("botonConsultarActividad")
    botonConsultarActividad.disabled = !document.getElementById("campoconsulta").value

}

function verificarCampoBusqueda() {

    botonBuscarPuntosDeVenta = document.getElementById("botonBuscarPuntosDeVenta")
    botonBuscarPuntosDeVenta.disabled = !document.getElementById("campobusqueda").value

}

function verificarCampoBusquedaRecarga(){

    document.getElementById("botonBuscarPuntoRecarga").disabled = document.getElementById("campobusquedarecarga").value == ""

}

function verificarCampoRecarga(){
    document.getElementById("botonRecargar").disabled = document.getElementById("campoidpuntodeventa").value == "0" || document.getElementById("campoidpuntodeventa").value == "" || document.getElementById("montototal").value == 0
    // console.log(!document.getElementById("campoidpuntodeventa").value && !document.getElementById("montototal").value)
    // console.log(document.getElementById("montototal").value)
    // console.log(document.getElementById("campoidpuntodeventa").value)
}

function actualizarMonto() {
    document.getElementById("montototal").value = document.getElementById("selectormonto").value 
    verificarCampoRecarga()
}

function buscarYMostrarPuntosDeVentaConsulta() {

    campoconsulta = document.getElementById("campobusqueda")

    tabla = document.getElementById('tablaresultadosconsulta').getElementsByTagName('tbody')[0]

    $.ajax({
        url: serverUrl + 'api/puntosdeventa/consultar',
        type: "GET",
        headers: {
            "campoconsulta": campoconsulta.value,
        },
        success: (result) => {

            nuevaTabla = document.getElementById('tablaresultadosconsulta')

            for (var i = nuevaTabla.rows.length - 1; i > 0; i--) {
                nuevaTabla.deleteRow(i);
            }

            if (result.resultadobusqueda == "sin resultados") {
                let res = tabla.insertRow(0).insertCell(0)
                res.appendChild(document.createTextNode("NO SE ENCONTRARON RESULTADOS CON LOS DATOS PROVISTOS"))
                return
            }

            console.log(result)
            tableContent = result.resultadobusqueda

            for (i = 0; i < tableContent.length; i++) {
                let newRow = tabla.insertRow()

                let celdaCodigo = newRow.insertCell(0)
                let celdaNombre = newRow.insertCell(1)
                let celdaDomicilio = newRow.insertCell(2)
                let celdaSaldo = newRow.insertCell(3)

                let textoCodigo = document.createTextNode(tableContent[i].codigo)
                let textoNombre = document.createTextNode(tableContent[i].nombre)
                let textoDomicilio = document.createTextNode(tableContent[i].domicilio)
                let textoSaldo = document.createTextNode(tableContent[i].saldo)

                celdaCodigo.appendChild(textoCodigo)
                celdaNombre.appendChild(textoNombre)
                celdaDomicilio.appendChild(textoDomicilio)
                celdaSaldo.appendChild(textoSaldo)

            }

            $("#tablaresultadosconsulta tr").click(function (e) {
                //$(this).addClass('selectedRow').siblings().removeClass('selectedRow');
                var value = $(this).find('td:first').html();
                document.getElementById("campoconsulta").value = value
                UIkit.modal(document.getElementById("modalBuscarPuntoDeVentaConsulta")).hide()
                verificarCampoConsulta()
                //document.getElementById("botonAbrirModalBuscar").toggleAttribute("uk-toggle")

            });

        }
    })

}

function buscarYMostrarPuntosDeVentaRecarga() {

    campoconsulta = document.getElementById("campobusquedarecarga")

    // rowinicial = nuevaTabla.insertRow(0)

    // rowinicial.insertCell(0).appendChild(document.createTextNode("CODIGO"))
    // rowinicial.insertCell(1).appendChild(document.createTextNode("NOMBRE"))
    // rowinicial.insertCell(2).appendChild(document.createTextNode("DOMICILIO"))
    // rowinicial.insertCell(3).appendChild(document.createTextNode("SALDO"))

    var tabla = document.getElementById('tablaresultadosrecarga').getElementsByTagName('tbody')[0]

    $.ajax({
        url: serverUrl + 'api/puntosdeventa/consultar',
        type: "GET",
        headers: {
            "campoconsulta": campoconsulta.value,
        },
        success: (result) => {

            nuevaTabla = document.getElementById('tablaresultadosrecarga')

            for (var i = nuevaTabla.rows.length - 1; i > 0; i--) {
                nuevaTabla.deleteRow(i);
            }

            if (result.resultadobusqueda == "sin resultados") {
                let res = tabla.insertRow(0).insertCell(0)
                res.appendChild(document.createTextNode("NO SE ENCONTRARON RESULTADOS CON LOS DATOS PROVISTOS"))
                return
            }

            console.log(result)
            var tableContent = result.resultadobusqueda

            for (i = 0; i < tableContent.length; i++) {
                let newRow = tabla.insertRow()

                let celdaCodigo = newRow.insertCell(0)
                let celdaNombre = newRow.insertCell(1)
                let celdaDomicilio = newRow.insertCell(2)
                let celdaSaldo = newRow.insertCell(3)

                let textoCodigo = document.createTextNode(tableContent[i].codigo)
                let textoNombre = document.createTextNode(tableContent[i].nombre)
                let textoDomicilio = document.createTextNode(tableContent[i].domicilio)
                let textoSaldo = document.createTextNode(tableContent[i].saldo)

                celdaCodigo.appendChild(textoCodigo)
                celdaNombre.appendChild(textoNombre)
                celdaDomicilio.appendChild(textoDomicilio)
                celdaSaldo.appendChild(textoSaldo)

            }

            $("#tablaresultadosrecarga tr").click(function (e) {
                //$(this).addClass('selectedRow').siblings().removeClass('selectedRow');
                var value = $(this).find('td:first').html();
                document.getElementById("campoidpuntodeventa").value = value
                UIkit.modal(document.getElementById("modalBuscarPuntoDeVentaRecarga")).hide()
                verificarCampoRecarga()
                //document.getElementById("botonAbrirModalBuscar").toggleAttribute("uk-toggle")

            });

        }
    })

}

function configurarCampoConsulta() {

    nuevaTabla = document.getElementById('tablaresultadosconsulta')

    for (var i = nuevaTabla.rows.length - 1; i > 0; i--) {
        nuevaTabla.deleteRow(i);
    }

    var campoconsulta = document.getElementById("campobusqueda")

    campoconsulta.addEventListener("keyup", (e) => {
        if (e.keyCode === 13 && campoconsulta.value != "") {
            e.preventDefault()
            buscarYMostrarPuntosDeVentaConsulta()
        }
    })

}

function configurarCampoConsultaRecarga() {

    nuevaTabla = document.getElementById('tablaresultadosrecarga')

    for (var i = nuevaTabla.rows.length - 1; i > 0; i--) {
        nuevaTabla.deleteRow(i);
    }

    var campoconsulta = document.getElementById("campobusquedarecarga")

    campoconsulta.addEventListener("keyup", (e) => {
        if (e.keyCode === 13 && campoconsulta.value != "") {
            e.preventDefault()
            buscarYMostrarPuntosDeVentaRecarga()
        }
    })

}

function parametrizarRecarga(){

    document.getElementById("infoModalMonto").value = document.getElementById("montototal").value
    document.getElementById("infoModalCodigoPuntoDeVenta").value = document.getElementById("campoidpuntodeventa").value
    document.getElementById("botonConfirmarRecarga").disabled = false

    $.ajax({
        url: serverUrl + 'api/puntosdeventa/consultar',
        type: "GET",
        headers: {
            "campoconsulta": document.getElementById("campoidpuntodeventa").value,
        },
        success: (result) => {
            if (result.resultadobusqueda != "sin resultados"){
                responseJson = JSON.parse(JSON.stringify(result))
                document.getElementById("infoModalPuntoDeVenta").value = responseJson.resultadobusqueda[0].nombre
            }
            else{
                document.getElementById("infoModalPuntoDeVenta").value = "No se encontro punto de venta con el codigo provisto"
                document.getElementById("botonConfirmarRecarga").disabled = true
            }
        }
    })

}

function verificarCamposAlta(){

    campoNombre = document.getElementById("campoNombreAlta") 
    campoCalle = document.getElementById("campoCalleAlta")
    campoAltura = document.getElementById("campoAlturaAlta")
    campoCUIT = document.getElementById("campoCUITAlta")

    botonDarDeAlta = document.getElementById("botonDarDeAlta")

    botonDarDeAlta.disabled = campoNombre.value == "" || campoCalle.value == "" || campoAltura.value == "" || campoCUIT.value.length != 11 

}