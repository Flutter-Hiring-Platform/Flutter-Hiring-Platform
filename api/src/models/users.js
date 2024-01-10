const mongoose = require("mongoose");

const usersSchema = new mongoose.Schema({
  username: String,
  // email: String,
  password: String,
});

const Users = mongoose.model("Users", usersSchema);

module.exports = Users;
