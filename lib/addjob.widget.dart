
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'work.dart';
import 'add_job.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({Key? key, required this.title});
  final String title;

  @override
  State<AddJobWidget> createState() => _AddJobWidgetState();
}

class _AddJobWidgetState extends State<AddJobWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController salaryMaxController = TextEditingController();
  TextEditingController salaryMinController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController contractTypeController = TextEditingController();
  Future<Work>? _futureUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const Text("Add a new job announce "),
            SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descripton',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: salaryMaxController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary Max',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: salaryMinController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary Min',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: companyController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Company',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  TextField(
                    controller: contractTypeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contract Type',
                    ),
                    onChanged: (str) {
                      print("$str");
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureUser = createJob(titleController.text, descriptionController.text, locationController.text, salaryMaxController.text, salaryMinController.text, companyController.text, contractTypeController.text);
                      });
                    },
                    child: const Text('Add +'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
