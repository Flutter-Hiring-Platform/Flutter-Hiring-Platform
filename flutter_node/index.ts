import { config } from "dotenv";
config(); //Permet de charger les variables d'environnement
import axios from "axios";

import express from "express";
import * as bodyParser from "body-parser";
import * as mongoose from "mongoose";
import { JobModel, JobProps } from "./models/job.model";

type Job = {
  title: string;
  description: string;
  location: string;
  salary_min: string;
  salary_max: string;
  company: string;
  contract_type: string;
  created: string;
};

type GetJobsResponse = {
  data: Job[];
};

async function startServer(): Promise<void> {
  await mongoose.connect(
    "mongodb+srv://alexkhoury:flutter@flutter.pl8tggv.mongodb.net/?retryWrites=true&w=majority"
  );

  const app = express();

  app.use(bodyParser.json());

  app.listen(process.env.PORT, function () {
    console.log("Server started on port " + process.env.PORT);
  });
}

async function saveJobsToMongoDB(jobs: Job[]): Promise<void> {
  try {
    // Save each job to MongoDB
    for (const job of jobs) {
      await JobModel.create(job);
      console.log(`Job titled "${job.title}" saved to MongoDB`);
    }
  } catch (error) {
    console.error("Error saving jobs to MongoDB:", error);
  }
}
async function getJobs() {
  try {
    const { data, status } = await axios.get<GetJobsResponse>(
      "https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=e0f427fc&app_key=cb37fb00c4704609736a73118a96ee4b&results_per_page=20&what=javascript%20developer&content-type=application/json",
      {
        headers: {
          Accept: "application/json",
        },
      }
    );
    const jobResults = data["results"];

    jobResults.forEach((job, index) => {
      const jobData: JobProps = {
        title: job.title,
        description: job.description,
        location: job.location.display_name,
        salary_min: job.salary_min,
        salary_max: job.salary_max,
        company: job.company.display_name,
        contract_type: job.contract_type,
        created: job.create,
      };
      saveJobsToMongoDB([jobData]);

      console.log(job.location.display_name);
    });

    return data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.log("error message: ", error.message);
      return error.message;
    } else {
      console.log("unexpected error: ", error);
      return "An unexpected error occurred";
    }
  }
}

getJobs();

startServer();
