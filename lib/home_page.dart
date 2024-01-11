import 'package:flutter/material.dart';
import 'login_page.widget.dart';
import 'signup_page.widget.dart';
import 'addjob_page.widget.dart';
import 'joblist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
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
         TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AddJob()));
                  },
                  child: const Text('+ Job'),
                ),
        ], 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to LinkedIn !',
                    style: TextStyle(fontSize: 24)),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => const Login())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet ? sign up for free !",
                    style: TextStyle(fontSize: 24)),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => const Signup())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
