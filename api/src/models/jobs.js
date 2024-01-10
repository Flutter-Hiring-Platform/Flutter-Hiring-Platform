const mongoose = require ('mongoose');

const jobsSchema = new mongoose.Schema({
  title: String,
  description: String,
  location: String,
  salary_min: String,
  salary_max: String,
  company: String,
  contract_type: String,
});

const Jobs = mongoose.model('Jobs', jobsSchema);

module.exports = Jobs;