import 'package:flutter/material.dart';
import 'work.dart'; // Make sure to import your Work class

class WorkDetailsWidget extends StatelessWidget {
  final Work work;

  const WorkDetailsWidget({Key? key, required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${work.title}'),
            Text('Company: ${work.company}'),
            Text('Location: ${work.location}'),
            Text('Description: ${work.description}'),
            Text('Salary Range: ${work.salary_min} - ${work.salary_max}'),
            Text('Contract Type: ${work.contract_type}'),
          ],
        ),
      ),
    );
  }
}
