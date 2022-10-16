const mongoose = require("mongoose")

const MONGO_URL = process.env.MONGO_URL; 

const connectDB = async ()=>{
    try{
        const conn = await mongoose.connect(MONGO_URL,{
            useNewUrlParser: true,
            useUnifiedTopology: true
        })
        if(conn){
            console.log("database connected succesfully"); 
        }else{
            console.log("oops, database not connected"); 
        }

    }catch(err){
        console.log(err);
    }
}

module.exports = connectDB