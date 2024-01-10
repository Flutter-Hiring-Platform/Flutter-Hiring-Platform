// import 'package:job_app/jobs.service.dart';
import 'job.service.dart';
import 'package:job_app/joblist_page.widget.dart';
import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("Job List"),
        ),
        body: FutureBuilder(
          future: JobService.getJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("erreur de téléchargement"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return JobListWidget(jobs: snapshot.data!);
          },
        ),
      ),
    );
  }
}
