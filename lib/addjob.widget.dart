import 'package:flutter/material.dart';
import 'login_page.widget.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({super.key, required this.title});
  final String title;

  @override
  State<AddJobWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<AddJobWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Company',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Location',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Salary',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Category',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contract Type',
                        ),
                        onChanged: (str) {
                          print("$str");
                        }),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text('Add Job'),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
