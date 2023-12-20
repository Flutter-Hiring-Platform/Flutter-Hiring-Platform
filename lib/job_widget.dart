// import 'package:job_app/jobs.service.dart';
import 'jobs.service.dart';
import 'package:job_app/job_list.widget.dart';
import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Job List"),
        ),
        body: FutureBuilder(
          future: JobService.getJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) { 
              print('Snapshot error : ${snapshot}');
              return const Center(
                child: Text("erreur de téléchargement"),
              );
            }
            // if (snapshot.hasData) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return JobListWidget(jobs: snapshot.data!);
          },
        ));
  }
}
