import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Home_Page.dart';
import 'package:foot_balls_sport/LoginPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       initialRoute: '/',
      getPages: [
        // List all your routes here
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => HomePage()),
      ],
    );
  }
}

