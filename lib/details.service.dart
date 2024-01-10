import 'dart:convert';

import 'package:http/http.dart' as http;
import 'details.dart';

class DetailsService {

  static Future<List<Details>> getDetails(String id) async {

    final client = http.Client();
    final response = await client.get(Uri.parse("http://localhost:3000/job/$id"));
    if(response.statusCode == 200) {
      print(response.body);
      final json = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      print("$json");
      return json.map((element) => Details.fromJson(element)).toList();
    }
    return [];

  }

}