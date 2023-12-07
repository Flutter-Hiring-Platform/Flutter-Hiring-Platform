import 'package:flutter/material.dart';
import 'dashboard_employers.widget.dart';

class DashboardEmployers extends StatelessWidget {
  const DashboardEmployers({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardEmployersWidget(title: 'Flutter Demo Home Page'),
    );
  }
}