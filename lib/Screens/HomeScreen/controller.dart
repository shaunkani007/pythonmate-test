import 'package:get/get.dart';
import 'package:teat_app_pythonmate/Controllers/category_controller.dart';
import 'package:teat_app_pythonmate/Controllers/job_controller.dart';
import 'package:teat_app_pythonmate/Models/categories.dart';
import 'package:teat_app_pythonmate/Models/jobs.dart';

class HomeScreenController extends GetxController {
  @override
  Future<void> onInit() async {
    await getCategories();
    await getJobs();
    super.onInit();
  }

  var selectedCategory = 'Software Development'.obs;
  var isLoading = true.obs;
  var isJobLoading = true.obs;
  List<Category>? categories;
  List<Job>? jobs;

  Future<void> getCategories() async {
    setLoading(true);
    categories = await CategoryController().fetchCategories();
    setLoading(false);
  }

  Future<void> getJobs() async {
    isJobLoading.update((val) {
      isJobLoading.value = true;
    });
    var catSlug = categories!
        .firstWhere((element) => element.name == selectedCategory.value)
        .slug;
    jobs = await JobController().fetchJobs(catSlug!);
    isJobLoading.update((val) {
      isJobLoading.value = false;
    });
  }

  Future<void> updateSelectedCategory(String newCategory) async {
    bool flag = false;
    selectedCategory.update((val) {
      val == newCategory ? flag = true : flag = false;
      selectedCategory.value = newCategory;
    });
    if (!flag) await getJobs();
  }

  void setLoading(bool loading) {
    isLoading.update((val) {
      isLoading.value = loading;
    });
  }
}
