import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teat_app_pythonmate/Screens/HomeScreen/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
