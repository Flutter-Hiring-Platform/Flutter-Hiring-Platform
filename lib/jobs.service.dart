import "dart:convert";
import "package:http/http.dart" as http;
import "job.dart";

class JobService {

  static Future<List<Job>> getJobs() async {
    final client = http.Client();
    final response = await client.get(Uri.parse("https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=e0f427fc&app_key=cb37fb00c4704609736a73118a96ee4b&results_per_page=20&what=javascript%20developer&content-type=application/json"));
    if(response.statusCode == 200){
      // final json = (jsonDecode(response.body)['result'] as List).cast<Map<String, dynamic>>();
      final jsonResponse = jsonDecode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      // // Convert each result into a Job object
      // final List<Job> jobs = results.map((result) {
      //   print('Mapping Job: $result');
      //   return Job.fromJSON(result);
      // }).toList();

      return results.map((element) => Job.fromJSON(element)).toList();
    }
    return [];
  }
}