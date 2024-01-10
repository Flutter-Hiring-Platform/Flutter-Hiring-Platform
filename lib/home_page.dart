import 'package:flutter/material.dart';
import 'package:job_app/details.service.dart';
import 'package:job_app/details.wigdet.dart';
import 'package:job_app/detailsApi.dart';
import 'package:job_app/personalApi.dart';
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
                        //MaterialPageRoute(builder: (context) => const PersonalWidget()));
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DetailsWidget(id: _id)));
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
                            builder: (context) => const Detail(jobtitle: "JavaScript Developer",
                              description: "JavaScript Developer - London/Manchester Based £45 - £55 per annum We have partnered with one of the leading digital agencies in the UK, and they are looking for a frontend/Full-Stack Developer to join their team. You will be working in a team of 4 developers where you will be focusing",
                              location: "London, UK", typecontract: "permanent",
                              min: "45000", company: "Salt",
                              max: "55000",
                              id : "659c17cd49d7ba79a639365f",
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
