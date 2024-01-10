import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "user_login.dart";
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Center(child: Text(widget.title)),
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
                        onChanged: (str) {
                          print("$str");
                        }),
                        
                    TextField(
                      controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
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
