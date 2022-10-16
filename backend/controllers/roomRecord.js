const myRoom = require("../models/myRoomSchema"); 

const roomRecord = async (userName,roomId,roomName)=>{
    console.log(roomId +" "+ roomName)
    const roomIds = []; 
    const userExist = await myRoom.findOne({userName}); 
    // console.log(userExist);
    if(!userExist){
        roomIds.push({roomName,roomId}) 
        const newUser = new myRoom({userName,roomIds})
        try{
            const saveUser = await newUser.save(); 
            if(saveUser){
                console.log("user saved successfully!!"); 
            }
        }catch(err){
            console.log(err); 
        }
    }else{
            await myRoom.updateOne(
              { userName: userName },
              { $push: { roomIds: { roomName, roomId } } }
            );
    }
}

module.exports = roomRecord