import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'personalData.widget.dart';


Future<User> createUser(String username, String password, String email, BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password
    }),
  );

  if (response.statusCode == 201) {
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalDataWidget(username: username),
        ),
      );
    Fluttertoast.showToast(
        msg: "Account Created Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    Fluttertoast.showToast(
        msg: "Failed to create account email or/and username already taken",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    throw Exception('Failed to create user.');
  }
}
Future<User> userLogin(String username, String password, BuildContext context) async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/username/$username'),
  );
  if (response.statusCode == 201) {
    final name = jsonDecode(response.body)['username'];
    final pwd = jsonDecode(response.body)['password'];
    if(name == username && password == pwd){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalDataWidget(username: username),
        ),
      );
       Fluttertoast.showToast(
        msg: "Login Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login failed. Check your credentials.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else{
    print("IM HERE ________________");
     Fluttertoast.showToast(
        msg: "Login failed. Check your credentials.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    throw Exception('Failed to get user.');
  }
}

Future<User> getUserByName(String username) async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/username/$username'),
  );
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to get user.');
     Fluttertoast.showToast(
        msg: "User not found",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
  }
}
  