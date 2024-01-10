require("./db/mongoose");
const express = require("express");
const Users = require("./models/users");
const Jobs = require("./models/jobs");
var cors = require("cors");

const app = express();
app.use(cors());

app.use(express.json());

app.patch("/health", function (req, res) {
  res.send("ok");
});

// JOBS

app.get("/jobs", (req, res) => {
  Jobs.find()
    .then((job) => {
      res.status(201).send(job);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.post("/jobs", (req, res) => {
  const user = new Users(req.body);
  user
    .save()
    .then((job) => {
      res.status(201).send(job);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.get("/job/:id", (req, res) => {
  Jobs.findById(req.params.id)
    .then((job) => {
      res.status(201).send(job);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.delete("/job/:id", (req, res) => {
  Jobs.findByIdAndDelete(req.params.id)
    .then((job) => {
      res.status(201).send(job);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.patch("/job/:id", function (req, res) {
  Jobs.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((job) => {
      if (!job) {
        return res.status(404).send();
      }
      res.status(201).send(job);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

// USERS

app.get("/users", (req, res) => {
  Users.find()
    .then((user) => {
      res.status(201).send(user);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.post("/users", (req, res) => {
  const user = new Users(req.body);
  user
    .save()
    .then((user) => {
      res.status(201).send(user);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.get("/user/:id", function (req, res) {
  Users.findById(req.params.id)
    .then((user) => {
      res.status(201).send(user);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.delete("/user/:id", function (req, res) {
  Users.findByIdAndDelete(req.params.id)
    .then((user) => {
      res.status(201).send(user);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.patch("/user/:id", function (req, res) {
  Users.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((user) => {
      if (!user) {
        return res.status(404).send();
      }
      res.status(201).send(user);
    })
    .catch((error) => {
      res.status(400).send(error);
    });
});

app.listen(3000);
