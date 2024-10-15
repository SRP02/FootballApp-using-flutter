import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Bind/Binding.dart';
import 'package:foot_balls_sport/Home_Page.dart';
import 'package:foot_balls_sport/LoginPage.dart';
import 'package:foot_balls_sport/controller/favoriteTeamController.dart';
import 'package:get/get.dart';


void main() {
    Get.put(FavoriteTeamController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
      getPages: [
        // List all your routes here
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => HomePage(),binding: Appbinding()),
      ],
    );
  }
}

