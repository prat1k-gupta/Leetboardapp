const room = require("../models/roomSchema");
const fetchUsersData = require("./fetchUsersData");
const roomRecord = require("./roomRecord");
const bcrypt = require("bcryptjs")
const joinRoom = async (req,res)=>{
    const {roomId,userName,password} = req.body;
    const roomData = await room.findOne({ roomId });
    if (roomData.private) {
      const isCorrect = bcrypt.compare(password, roomData.password); 
      if(roomData.password == ""){
        return res.json({error: "This room is private please enter password!!"}); 
      }
      if (!isCorrect) {
        return res.json({ error: "Wrong password" });
      }
    }
    try{
        if(!roomData){
            return res.json({error: "room not found!!"})
        }
        if(roomData.users.includes(userName)){
            return res.json({error: "you are already in room"})
        }
        await room.updateOne({roomId: roomId},{$push : {users: userName}}); 
        res.send({roomId: roomId}) 
        await roomRecord(userName,roomId,roomData.roomName); 
    }catch(err){
        console.log(err); 
    }
}

module.exports = joinRoom