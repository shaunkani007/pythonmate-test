import 'package:http/http.dart' as http;
import 'package:teat_app_pythonmate/Models/jobs.dart';

class JobController {
  Jobs? jobs;

  Future<List<Job>?> fetchJobs(String categorySlug) async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(Uri.parse(
          'https://remotive.io/api/remote-jobs?category=$categorySlug'));
      if (uriResponse.statusCode == 200) {
        final jobs = jobsFromJson(uriResponse.body);
        return jobs.jobs;
      }
    } finally {
      client.close();
    }
  }
}
