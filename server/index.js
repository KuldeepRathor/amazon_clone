// Imports from packages

const express = require('express');
const mongoose = require('mongoose');
const DB = "mongodb+srv://cooldeep:12345@cluster0.cfzix0h.mongodb.net/?retryWrites=true&w=majority"

// Imports from other files

const authRouter = require("./routes/auth");


//Init
const app = express();

const PORT = 3000;

    

//middleware
app.use(express.json());
app.use(authRouter);


//connections
mongoose.connect(DB).then(() => {
    console.log("connected to database");
}).catch(e => {
    console.log(e);
})


app.listen(PORT, "0.0.0.0",() => {
    console.log(`connected at port ${PORT}`);
});



app.get("/",(req,res)=>{
    res.json({name:"Kuldeep Rathor"})
})

// app.get("/hello-world", (req, res)=>{
//     res.json({hi:'hello world'})

// });

// console.log(`Hello ALi`);
