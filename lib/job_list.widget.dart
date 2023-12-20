import "package:flutter/material.dart";
import "job.dart";
import "job_cell.dart";

class JobListWidget extends StatelessWidget {
  const JobListWidget({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return JobCell(job: jobs[index]);
        });
  }
}
