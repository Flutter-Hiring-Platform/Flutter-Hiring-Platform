import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "user_api.dart";
import "user.dart";
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.title});

  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Future<User>? _futureUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const Text("Login"),
            SizedBox(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                       
                    ),
                        
                    TextField(
                      controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                    ),
                        
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureUser = userLogin(usernameController.text, passwordController.text, context);
                        });
                      },
                      child: const Text('Login'),
                    ),
                    
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
