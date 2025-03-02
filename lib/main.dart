import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => InputScreen()),
      GetPage(name: '/result', page: () => ResultScreen()),
    ],
  ));
}
