import 'package:flutter/material.dart';
import 'package:job_app/details.service.dart';
import 'package:job_app/detailsApi.dart';
import 'package:job_app/personalData.widget.dart';
import 'login_page.widget.dart';
import 'signup_page.widget.dart';
import 'details_page.widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _id = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('User Data',
                    style: TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PersonalDataWidget(userid: "Alex", email: "email@gmail.com", pwd: "1234")));
                  },
                  child: const Text('Pesonal data'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to LinkedIn !',
                    style: TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text('Signin'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet ? sign up for free !",
                    style: TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child: const Text('Signup'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Try API !",
                    style: TextStyle(fontSize: 24)),
                SizedBox(
                  width: 300,
                  child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "id",
                      ),
                      onChanged: (str) {
                        _id = str;
                      }),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsApiWidget(id: _id)));
                  },
                  child: const Text('API'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Details",
                    style: TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Detail(jobtitle: "error", description: "error",
                              location: "error", typecontract: "error",
                              min: "error", company: "error",
                              max: "error",
                            )));
                  },
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
