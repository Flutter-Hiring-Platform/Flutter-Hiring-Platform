import 'package:flutter/material.dart';
import 'work.dart';
import 'job_api.dart';

class ApplyJob extends StatefulWidget {
  final Work work;

  ApplyJob(this.work);

  @override
  _ApplyJobState createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('TECH HIRING'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Title:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.work.title),
            SizedBox(height: 12),
            Text(
              'Company:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.work.company),
            SizedBox(height: 12),
            Text(
              'Your Information:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Your Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // applyJob(widget.work.id, usernameController.text).then((_) {
                Navigator.pop(context);
                // });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Submit Application'),
            ),
          ],
        ),
      ),
    );
  }
}
