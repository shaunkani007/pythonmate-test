import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teat_app_pythonmate/Screens/HomeScreen/controller.dart';
import 'package:teat_app_pythonmate/Widgets/job_list.dart';
import 'package:teat_app_pythonmate/Widgets/row_categories.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Obx(
              () {
                return controller.isLoading.value == false
                    ? CategoriesRow(categories: controller.categories!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Spacer(),
          Expanded(
            flex: 10,
            child: Obx(
              () {
                return controller.isJobLoading.value == false
                    ? JobList(jobs: controller.jobs!)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
