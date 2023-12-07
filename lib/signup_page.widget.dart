import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.widget.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignupWidget(title: 'Flutter Demo Home Page'),
    );
  }
}