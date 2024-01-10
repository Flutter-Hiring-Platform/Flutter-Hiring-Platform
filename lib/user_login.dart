import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

Future<User> userLogin(String username, String password) async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/username/$username'),
  );
  if (response.statusCode == 201) {
    final name = jsonDecode(response.body)['username'];
    final pwd = jsonDecode(response.body)['password'];
    if(name == username && password == pwd){
      print("login success");
    } else {
      print("login fail");
    }

    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create user.');
  }
}
// }