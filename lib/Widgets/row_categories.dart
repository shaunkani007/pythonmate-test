import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teat_app_pythonmate/Models/categories.dart';
import 'package:teat_app_pythonmate/Screens/HomeScreen/controller.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeScreenController>();
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 0.45,
            mainAxisSpacing: MediaQuery.of(context).size.width * 0.1,
          ),
          itemBuilder: (ctx, idx) => Obx(
            () => GestureDetector(
              onTap: () {
                homeController
                    .updateSelectedCategory(categories.elementAt(idx).name!);
              },
              child: Container(
                color: homeController.selectedCategory.value ==
                        categories.elementAt(idx).name!
                    ? Colors.red
                    : Colors.blue,
                child: Center(
                    child: Text(
                  categories.elementAt(idx).name!,
                  style: TextStyle(fontSize: 16),
                )),
              ),
            ),
          ),
        ));
  }
}
