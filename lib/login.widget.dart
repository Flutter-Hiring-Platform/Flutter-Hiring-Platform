import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.title});
  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("congrats"),
            SizedBox(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'UserID',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PassWord',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
