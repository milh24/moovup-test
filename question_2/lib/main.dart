import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:question_2/controllers/app_controller.dart';
import 'package:question_2/pages/home.dart';

void main() {
  Get.put<AppController>(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "question_2",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: Color(0xFFff5555),
          barBackgroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
