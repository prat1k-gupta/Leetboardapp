const { default: axios } = require("axios");
const express = require("express")
const cors = require('cors')
require("dotenv").config(); 
const connectDB = require("./config/connectDB")
const app = express(); 
app.use(express.json());
app.use(cors()); 
const fetchApi = require('./controllers/fetchApi')
const fetchAllData = require("./controllers/fetchAllData");
const getMedium = require("./controllers/getMedium");
const createRoom = require("./controllers/createRoom");
const fetchFromRoom = require("./controllers/fetchFromRoom");
const joinRoom = require("./controllers/joinRoom");
const roomRecord = require("./controllers/roomRecord");
const { get } = require("mongoose");
const getRooms = require("./controllers/getRooms");

app.get('/all',fetchAllData)

app.get('/showMedium/:user',getMedium)

app.get('/users/:user',fetchApi)


app.get('/',(req,res)=>{
    res.status(404).json({error: "Please enter a username after / as /user-name"})
})


app.post("/createroom",createRoom);

app.get("/rooms/:roomId",fetchFromRoom); 

app.post("/joinroom", joinRoom)

app.get("/myrooms/:userName",getRooms); 

connectDB(); 
const PORT = process.env.PORT;
app.listen(PORT,()=>{
    console.log(`server is running on ${PORT} BOSS!!`); 
})