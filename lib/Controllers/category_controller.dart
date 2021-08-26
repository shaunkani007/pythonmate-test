import 'package:teat_app_pythonmate/Models/categories.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  Categories? categories;

  Future<List<Category>?> fetchCategories() async {
    var client = http.Client();
    try {
      var uriResponse = await client
          .get(Uri.parse('https://remotive.io/api/remote-jobs/categories'));
      if (uriResponse.statusCode == 200) {
        final categories = categoriesFromJson(uriResponse.body);
        return categories.categories;
      }
    } finally {
      client.close();
    }
  }
}
