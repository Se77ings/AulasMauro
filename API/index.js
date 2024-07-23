const express = require("express");
const app = express();
// const cors = require("cors");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// app.use(cors());

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});

app.get("/",(req,res)=>{
    function getRandom() {
        return Math.floor(Math.random() * 6) + 1;
    }
    const resultado = getRandom();
    
    res.json({dado: resultado})
    
})




