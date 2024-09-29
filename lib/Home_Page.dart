import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Screen/FootballMatch.dart';
import 'package:foot_balls_sport/Screen/Profile.dart';
import 'package:foot_balls_sport/Screen/TopPlayer.dart';
import 'package:foot_balls_sport/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonNavController = Get.put(BottomNavController());

    final List<Widget> menus = [
      SoccerApp(),
      Topplayer(),
      Profile(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[buttonNavController.selectedIndex.value],
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: buttonNavController.selectedIndex.value,
          showElevation: true,
          onItemSelected: (index) => buttonNavController.changeIndexMenu(index),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.sports),
              title: Text('Match'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.sports_soccer_outlined),
              title: Text('Top Player'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.assistant_photo_outlined),
              title: Text('Profile'),
            ),
          ],
        ),
      );
    });
  }
}
