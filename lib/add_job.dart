// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'job.dart';

// Future<Job> createJob(String title, String description, String location, String, location, String salary_max, String salary_min, String company, String contract_type) async {
//   final response = await http.post(
//     Uri.parse('http://localhost:3000/jobs'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//         'title': title,
//         'description': description,
//         'location': location,
//         'salary_min': salary_min,
//         'salary_max': salary_max,
//         'company': company,
//         'contract_type': contract_type,

//     }),
//   );

//   if (response.statusCode == 201) {
//     return Job.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to create a job.');
//   }
// }
// // }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

Future<User> createJob(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {

    print("ok");
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create user.');
  }
}
// }