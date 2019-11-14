const {PythonShell} = require('python-shell')
const mysql = require('mysql');

const db = mysql.createConnection ({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'biblioteca'
});

db.connect((err) => {
  if (err) {
      throw err;
  }
  console.log('Connected to database');
});
global.db = db;

function abrirBuscador() {
  const remote = require('electron').remote;
  const BrowserWindow = remote.BrowserWindow;
  const win = new BrowserWindow({
    height: 600,
    width: 800
  });

  win.loadURL('buscadorBibliografia.html');
}

function darDeAltaBibliografia(){

    let titulo = document.getElementById('tituloInput').value
    let autores = document.getElementById('autoresInput').value
    let anioPublicacion = document.getElementById('anioPublicacionInput').value
    let editorial = document.getElementById('editorialInput').value
    let ISBN = document.getElementById('ISBNInput').value
    let descripcion = document.getElementById('descripcionInput').value
    let edicion = document.getElementById('edicionInput').value
    let lugarImpresion = document.getElementById('lugarImpresionInput').value

    alert(titulo)

    var options = {
        mode: "text",
        args: [titulo,autores,anioPublicacion,editorial,ISBN,descripcion,edicion,lugarImpresion,1,1,1]
    }

    let insertQuery = new PythonShell('pythons/altaBibliografia.py',options)

    insertQuery.on('message', message => {

        if(message.includes("2003"))
            alert("No se pudo conectar a la base de datos. Verifique que el servicio de MySQL esté funcionando e "+
            "intente nuevamente")
        else
          alert(message)
          
        console.log(message)
    })

}

function configurarCategoriasCDU(){



  var options ={
    args:[]
  }

  let actualizarCategoriasCDU = new PythonShell('pythons/actualizarCategoriaCDU.py',options)

  actualizarCategoriasCDU.on("message", message =>{

    categoriaCDU = document.getElementById("categoriaCDU")

    respuesta = JSON.parse(message)

        limite = respuesta.length
        contador = 0
        while (contador < limite) {

            option = document.createElement("option");
            option.text = respuesta[contador][0]
            categoriaCDU.appendChild(option);

            contador++

        }

  })

}

function actualizarMaterias(){

  document.getElementById("materiaCDU").options.length = 0;
  document.getElementById("submateriaCDU").options.length = 0;

  var options ={
    args:[document.getElementById("categoriaCDU").value]
  }

  let actualizarCategoriasCDU = new PythonShell('pythons/actualizarMateriaCDU.py',options)

  actualizarCategoriasCDU.on("message", message =>{

    categoriaCDU = document.getElementById("materiaCDU")

    respuesta = JSON.parse(message)

    limite = respuesta.length
    contador = 0
    while (contador < limite) {

        option = document.createElement("option");
        option.text = respuesta[contador][0]
        categoriaCDU.appendChild(option);

        contador++

    }

  })

}

function actualizarSubMaterias(){
  document.getElementById("submateriaCDU").options.length = 0;

  nombreMateria = document.getElementById("materiaCDU").value

  submateriaCDU = document.getElementById("submateriaCDU")

  query = "SELECT nombresubmateria from submateriacdu where numeromateria = (SELECT numeromateria from materiacdu where nombremateria LIKE '"+nombreMateria+"%')"

  console.log(query)

  db.query(query,(err,result)=>{


    respuesta.forEach(element => {
      console.log(element[0])


        option = document.createElement("option");
        option.text = element[0]
        submateriaCDU.appendChild(option);
    });


  })
  
}