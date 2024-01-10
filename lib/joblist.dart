import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'work.dart';
import 'job_detail.dart';

class JobWidget extends StatefulWidget {
  const JobWidget({Key? key}) : super(key: key);

  @override
  _JobWidgetState createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  late Future<List<Work>> futureWorks;

  @override
  void initState() {
    super.initState();
    futureWorks = fetchWorks();
  }

  Future<List<Work>> fetchWorks() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/jobs'),
    );
    if (response.statusCode == 201) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Work> works = jsonData.map((data) => Work.fromJson(data)).toList();
      return works;
    } else {
      throw Exception('Failed to load works');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: FutureBuilder<List<Work>>(
        future: futureWorks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text("Location: " + snapshot.data![index].company),
                  // trailing: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const getWorkByTitle(snapshot.data![index].title)));
                  //     },
                  //     child: const Text('More'),
                  // ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
