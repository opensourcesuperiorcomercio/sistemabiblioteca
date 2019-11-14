const electron = require('electron');
const app = electron.app
const BrowserWindow = electron.BrowserWindow

global.user = {nombre: "ALGUNA COSA",id: "12345"}

console.log(global.user)

function createLogin () {
  // Create the browser window.

  global.ventana = new BrowserWindow({
    width: 550,
    height: 460,  
    webPreferences: {
      nodeIntegration: true
    },
    resizable: false 
  })

  // and load the index.html of the app.
  global.ventana.loadFile('htmls/index.html')

}

app.on('ready', createLogin)