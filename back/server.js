const express = require('express')
const app = express()
const { connection } = require("./db")
const routes = require('./routes')
const morgan = require('morgan')
const port = 3000

app.use(express.json())
app.use(express.urlencoded({extended: false}))
app.use(morgan('tiny'))

app.use("/api", routes);

connection.on("error", console.error.bind(console, "connection error:"))

connection.once("open", () => {
  console.log("Connectado a la DB puerto", port)
  app.listen(port, () => console.log(`Server conectado y escuchando en Cluster`))
})
