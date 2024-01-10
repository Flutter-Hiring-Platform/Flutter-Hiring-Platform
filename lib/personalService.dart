import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job_app/personalData.dart';
import 'details.dart';

class PersonalService {

  static Future<List<PersonalData>> getPersonalData(String id) async {

    final client = http.Client();
    final response = await client.get(Uri.parse("http://localhost:3000/job/$id"));
    if(response.statusCode == 200) {
      print(response.body);
      final json = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      print("$json");
      return json.map((element) => PersonalData.fromJson(element)).toList();
    }
    return [];

  }

}