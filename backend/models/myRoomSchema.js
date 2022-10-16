const mongoose = require("mongoose")

const myRoomSchema = new mongoose.Schema(
    {
        userName: {
            type: String,
            required: true
        },
        roomIds: [
            {
                roomName: {
                    type: String,
                    required: false
                },
                roomId: {
                    type: String,
                    required: false
                }
            }
        ]

    }
)

const myRoom = mongoose.model("myroom",myRoomSchema); 

module.exports = myRoom