import 'package:flutter/material.dart';
import 'work.dart';
import 'home_page.dart';
import 'job_api.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({Key? key, required this.title}) : super(key: key);

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
  Future<Work>? _futureJob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'LinkedIn')),
            );
          },
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Add a new job announcement",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 16),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: salaryMaxController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Salary Max',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: salaryMinController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Salary Min',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: companyController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: contractTypeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contract Type',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _futureJob = createJob(
                            titleController.text,
                            descriptionController.text,
                            locationController.text,
                            salaryMaxController.text,
                            salaryMinController.text,
                            companyController.text,
                            contractTypeController.text,
                            context,
                          );
                        });
                      },
                      child: Text('Add +'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
