import 'dart:convert';

import 'package:http/http.dart' as http;
import 'details.dart';

class DetailsService {

  static Future<List<Details>> getDetails(String id) async {

    final client = http.Client();
    final response = await client.get(Uri.parse("http://localhost:3000/job/$id"));
    //(response.statusCode);
    if(response.statusCode == 201) {
    //   print(response.body);
    //  final json = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
    //   print("$json");
    //   return json.map((element) => Details.fromJson(element)).toList();
    //
      print(response.body);
      return Details.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }else{
      throw Exception('Failed to load data');
    }

  }

}