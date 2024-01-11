import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/home_page.dart';
import 'joblist.dart';
import 'user_api.dart';
import 'user.dart';

class PersonalDataWidget extends StatefulWidget {
  const PersonalDataWidget({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  _PersonalDataWidgetState createState() => _PersonalDataWidgetState();
}

class _PersonalDataWidgetState extends State<PersonalDataWidget> {
  late Future<User> _userData;

  @override
  void initState() {
    super.initState();
    _userData = getUserByName(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        leading: const BackButton(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const JobWidget(),
                ),
              );
            },
            child: const Text('Job List'),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final User user = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Username: ${widget.username}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Email: ${user.email}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Add other details as needed
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const MyHomePage(title: 'LinkedIn'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                    ),
                    child: const Text(
                      'Go to Home page',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
