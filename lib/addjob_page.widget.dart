import 'package:flutter/material.dart';
import 'addjob.widget.dart';

class AddJob extends StatelessWidget {
  const AddJob({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AddJobWidget(title: 'Add a job'),
    );
  }
}