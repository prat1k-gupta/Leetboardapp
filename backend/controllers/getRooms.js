const myRooms = require("../models/myRoomSchema")

const getRooms = async (req,res)=>{
    const userName = req.params.userName; 
    try{
        const myrooms = await myRooms.findOne({userName: userName})
        if(!myrooms){
            return res.json({error: "you don't have any rooms yet"}); 
        }
        res.send(myrooms); 
        
    }catch(err){
        console.log(err); 
    }
}

module.exports = getRooms