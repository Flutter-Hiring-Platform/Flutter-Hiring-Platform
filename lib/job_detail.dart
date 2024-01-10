import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'work.dart';

Future<Work> getWorkById(String id) async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/job/$id'),
  );
  print(response.body);
  if (response.statusCode == 201) {
      return Work.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print(id);
     throw Exception('Failed to get job.');
    }
}