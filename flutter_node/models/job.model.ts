import * as mongoose from "mongoose";
import { Schema, Document } from "mongoose";

export interface JobProps {
  title: string;
  description: string;
  location: string;
  salary_min: string;
  salary_max: string;
  company: string;
  contract_type: string;
  created: string;
}

export type JobDocument = JobProps & Document;

const jobSchema = new Schema(
  {
    title: {
      type: Schema.Types.String,
      required: true,
    },
    description: {
      type: Schema.Types.String,
      // required: true,
    },
    location: {
      type: Schema.Types.String,
      // required: true,
    },
    salary_min: {
      type: Schema.Types.String,
    },
    salary_max: {
      type: Schema.Types.String,
    },
    company: {
      type: Schema.Types.String,
    },
    contract_type: {
      type: Schema.Types.String,
    },
    created: {
      type: Schema.Types.String,
    },
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

export const JobModel = mongoose.model<JobDocument>("Jobs", jobSchema);
