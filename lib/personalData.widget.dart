import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/home_page.dart';

class PersonalDataWidget extends StatelessWidget {
  const PersonalDataWidget({super.key, required this.userid,
    required this.email, required this.pwd});
  final String userid;
  final String email;
  final String pwd;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Personal Data')),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 600,
              height: 500,
              child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('UserId: '),
                        Text(userid)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('e-mail: '),
                        Text(email)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Password: '),
                        Text(pwd)
                      ],
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'LinkedIn')));
                        },
                        child: const Text('Go to Home page')
                    ),

                  ]),
            )
          ],
        ),
      ),
    );
  }
}
