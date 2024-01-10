import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'work.dart';

Future<Work> createJob(String title, String description, String location, String salary_max, String salary_min, String company, String contract_type) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/jobs'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", 
      // "Access-Control-Allow-Credentials":true, 
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

  if (response.statusCode == 201) {

    print("ok");
    return Work.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create job.');
  }
}