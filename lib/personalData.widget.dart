import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/home_page.dart';
import 'joblist.dart';
import 'user_api.dart';
import 'user.dart';

class PersonalDataWidget extends StatelessWidget {
  const PersonalDataWidget({super.key, required this.username,
    // required this.email
    // required this.pwd
    });
  final String username;
  // final String email;
  // final String pwd;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
     return FutureBuilder<User>(
      future: getUserByName(username),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final User user = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Personal Data'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const BackButton(),
               actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobWidget()));
                  },
                  child: const Text('Job List'),
                ),
               ]
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Username: $username'),
                  Text('Email: ${user.email}'),
                  // Add other details as needed
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'LinkedIn')),
                      );
                    },
                    child: const Text('Go to Home page'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}