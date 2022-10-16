require("dotenv").config(); 
const nodemailer = require("nodemailer");
const emailer = async (ownerEmail,roomId)=>{

    const options = {
        service: "gmail",
        port: 587,
        secure: false,
        auth: {
            user: process.env.EMAIL_FROM,
            pass: process.env.EMAIL_PASS,
        },
    };
    const transporter = nodemailer.createTransport(options);

    const mailOptions = {
      to: ownerEmail,
      from: process.env.EMAIL_FROM,
      subject: `Here is your room id: ${roomId}`,
      text: "Thanks for creating room on leetboard",
      html: `<h1>Congratulations for creating a room!!</h1></br><p>here is your room id: <b>${roomId}</b><p><br><p>Have a nice day!!</p>`,
    };
    try {
        const info = await transporter.sendMail(mailOptions);
        if (info) {
            console.log("email sent!!");
        }
    } catch (err) {
        console.log(err);
    }   
}

module.exports = emailer