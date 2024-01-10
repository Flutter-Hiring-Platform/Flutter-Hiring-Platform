import 'package:flutter/material.dart';
import 'details.wigdet.dart';

class Detail extends StatelessWidget {
  const Detail({super.key,
  required this.jobtitle, required this.description,
  required this.location, required this.company,
  required this.typecontract, required this.min,
  required this.max});
  final String jobtitle;
  final String description;
  final String location;
  final String company;
  final String typecontract;
  final String min;
  final String max;

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
      home: DetailWidget(title: 'Jobs Details', jobtitle: jobtitle, description: description, location: location, company: company, typecontract :typecontract,  min: min, max:max),
    );
  }
}