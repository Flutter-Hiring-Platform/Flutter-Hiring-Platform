const mongoose = require("mongoose");

const usersSchema = new mongoose.Schema({
  username: { type: String, unique: true },
  email: { type: String, unique: true },
  password: String,
  applied_job: { type: [String] },
});

const Users = mongoose.model("Users", usersSchema);

module.exports = Users;
