import 'package:flutter/material.dart';
import 'work.dart';
import 'job_api.dart';
import 'apply_job.widget.dart';

class WorkDetailsWidget extends StatelessWidget {
  final Work work;


  const WorkDetailsWidget({Key? key, required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TECH HIRING'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(work.title),
              SizedBox(height: 12),
              Text(
                'Company:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(work.company),
              SizedBox(height: 12),
              Text(
                'Location:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(work.location),
              SizedBox(height: 12),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(work.description),
              SizedBox(height: 12),
              Text(
                'Salary Range:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${work.salary_min} - ${work.salary_max}'),
              SizedBox(height: 12),
              Text(
                'Contract Type:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(work.contract_type),
              ElevatedButton(
                onPressed: () {
                  // Add your apply logic here
                  // For example, you can navigate to an ApplyScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplyJob(work)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Change color as needed
                ),
                child: Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
