import 'package:flutter/material.dart';
import 'addjob_page.widget.dart';

class DashboardEmployersWidget extends StatefulWidget {
  const DashboardEmployersWidget({super.key, required this.title});
  final String title;

  @override
  State<DashboardEmployersWidget> createState() =>
      _DashboardEmployersWidgetState();
}

class _DashboardEmployersWidgetState extends State<DashboardEmployersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add all jobs published by the employer (OPTIONAL : add option to delete or modify).
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddJob()));
              },
              child: const Text('Add a Job'),
            ),
          ],
        ),
      ),
    );
  }
}
