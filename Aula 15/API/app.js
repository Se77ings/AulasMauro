const express = require("express");
const app = express();
// const cors = require("cors");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// app.use(cors());

app.listen(30000, () => {
  console.log("Server is running on port 30000");
});

app.get("/", (req, res) => {
  function getRandom() {
    return Math.floor(Math.random() * 6) + 1;
  }
  var ip = req.ip;
  ip = ip.split(":")[ip.length-1];

  const resultado = getRandom();
  res.json({ dado: resultado, ipRequest: ip });
});
