
const room = require("../models/roomSchema");
const fetchUsersData = require("./fetchUsersData");
const fetchFromRoom = async (req,res)=>{
    const roomId = req.params.roomId; 
    const getRoom = await room.findOne({roomId});
    console.log(getRoom); 
    if (!getRoom) {
      return res.status(422).json({ error: "room not found!!" });
    }
    const usersData = await fetchUsersData(getRoom.users);  
    const finalData = {
        avatar: getRoom.avatar,
        roomName: getRoom.roomName,
        roomId: getRoom.roomId,
        ownerId: getRoom.ownerId,
        users: usersData
    }
    res.send(finalData)
}

module.exports = fetchFromRoom; 