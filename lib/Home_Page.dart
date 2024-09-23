import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Page/FootballMatch.dart';
import 'package:foot_balls_sport/Page/TopPlayer.dart';
import 'package:foot_balls_sport/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // connect ui to controller
    final buttonNavController = 
    Get.put(BottomNavController());

    final List<Widget> menus = [
      SoccerApp(),
      Topplayer()
    ];
    
    return Obx(() { 
      return Scaffold(
        body: menus[buttonNavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: buttonNavController.selectedIndex.value,
          onTap: (value) => buttonNavController.changeIndexMenu(value),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_outlined),
              label: 'Match',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Top Player',
            ),
          ],
        ),
      );
    });
  }
}
