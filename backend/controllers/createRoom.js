const mongoose = require("mongoose")
const room = require("../models/roomSchema");
const fetchApi = require("./fetchApi");
const fetchUsersData = require("./fetchUsersData");
const userCheck = require("./userCheck");
const emailer = require("./emailer");
const roomRecord = require("./roomRecord");
require("dotenv").config();
const createRoom = async (req,res)=>{
    
    let {avatar,roomName,roomId,ownerId,users,ownerEmail,private,password} = req.body;
    // try{
    //     const userExist = await userCheck(ownerId);
        
    //     if (
    //       typeof userExist === "string" &&
    //       userExist.includes("That user does not exist")
    //     )
    //       return res.status(422).json({ error: "user doesn't exist" });

    // }catch(err){
    //     console.log(err); 
    // }
    const newRoom = new room({avatar,roomName, roomId, ownerId, users,ownerEmail,private,password});
    try{ 
        const saveRoom = await newRoom.save(); 
        if(saveRoom){
            console.log("room created"); 
            res.send({roomId: roomId}); 
            for (let i = 0; i < users.length; i++) {
              await roomRecord(users[i], roomId,roomName);
            }
            emailer(ownerEmail,roomId)
        }
        
    }catch(err){
        console.log(err);
        // res.status(402).json({error: err}); 
    }
}

module.exports = createRoom