// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'work.dart';

// Future<Work> getWorkByTitle(String title) async {
//   final response = await http.get(
//     Uri.parse('http://localhost:3000/job/title/$title'),
//   );
//   if (response.statusCode == 201) {
//     final workTitle = jsonDecode(response.body)['title'];
//     final pwd = jsonDecode(response.body)['password'];
//     if(workTitle == title){
//       return Work.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//     } else {
//      throw Exception('Failed to get job.');
//     }
//   }
// }