import 'dart:convert';

import 'package:http/http.dart' as http;
import 'details.dart';

class DetailsService {

  static Future<Details> getDetails(String id) async {

    final client = http.Client();
    final response = await client.get(Uri.parse("http://localhost:3000/jobs"));
    // if(response.statusCode == 200) {
    //   print(response.body);
    //   final json = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
    //   print("$json");
    //   return json.map((element) => Details.fromJson(element)).toList();
    // }
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return Details.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
      throw Exception('Failed to load album');
    }

  }

}