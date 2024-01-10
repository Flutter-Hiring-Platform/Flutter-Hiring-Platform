import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

// class CreateUser extends StatefulWidget {
//   const CreateWidget({super.key, required this.username, required this.password});

//   final String username;
//   final String password;

//   @override
//   State<CreateWidget> createState() => _CreateUserWidgetState();

Future<User> createUser(String username, String password) async {
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
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}
// }