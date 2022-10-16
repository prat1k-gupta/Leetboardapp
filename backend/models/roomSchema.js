const mongoose = require("mongoose")
const bcrypt = require("bcryptjs")
const roomSchema = new mongoose.Schema(
    {
        avatar:{
            type: String,
            required: false
        },
        roomName:{
            type: String,
            required: false
        },
        roomId: {
            type: String,
            required: false
        },
        ownerId: {
            type: String,
            required: false
        },
        private: {
            type: Boolean,
            required: true
        },
        password: {
            type: String,
            required: false
        },
        users: [
            {
                type:String,
            },
        ]
    }
)


roomSchema.pre("save", async function () {
  if (this.isModified("password")) {
    this.password = await bcrypt.hashSync(this.password, 12);
  }
});

const room = mongoose.model("room",roomSchema); 

module.exports = room;