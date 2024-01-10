import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'personalData.widget.dart';

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
  } else {
    throw Exception('Failed to get user.');
  }
}
// }