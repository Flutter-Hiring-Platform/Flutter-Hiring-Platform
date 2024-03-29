import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

//for notification success or failed
import 'joblist.dart';
import 'work.dart';

// ______________________ GET WORK BY ID ______________________

Future<Work> getWorkById(String id) async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/job/$id'),
  );
  if (response.statusCode == 201) {
    return Work.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to get job.');
  }
}
// ______________________ CREATE A JOB ______________________
Future<Work> createJob(String title, String description, String location,
    String salary_max, String salary_min, String company, String contract_type,
    BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/jobs'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'description': description,
      'location': location,
      'salary_min': salary_min,
      'salary_max': salary_max,
      'company': company,
      'contract_type': contract_type,
    }),
  );


// ______________________ SUCCESS ON CREATE A JOB ______________________
  if (response.statusCode == 201) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobWidget(),
      ),
    );
    Fluttertoast.showToast(
      msg: "Add Job Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    return Work.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

// ______________________ FAILED CREATE JOB ______________________
  } else {
    Fluttertoast.showToast(
      msg: "Add Job Fail",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    throw Exception('Failed to create job.');
  }
}


// ______________________ GET JOBS LIST ______________________
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

// ______________________ APPLY A JOB NEED TO BE FIXED ______________________
Future<List<Work>> applyJob(String username, String jobId) async {
  final userInfo = await http.get(
    Uri.parse('http://localhost:3000/username/$username'),
  );
  final userId = jsonDecode(userInfo.body)['id'];
  // print("IM HERE _____________"+jsonDecode(userInfo.body));
  // print("IM HERE _____________"+userId);
  final response = await http.patch(
    Uri.parse('http://localhost:3000/user/$userId'),
  );
  headers:
  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "PATCH, OPTIONS",
  };
  body:
  jsonEncode(<String, String>{
    'applied_job': jobId,
  });
  if (response.statusCode == 201) {
    List<dynamic> jsonData = jsonDecode(response.body);
    List<Work> works = jsonData.map((data) => Work.fromJson(data)).toList();
    return works;
  } else {
    throw Exception('Failed to load works');
  }
}