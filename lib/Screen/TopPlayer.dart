import 'package:flutter/material.dart';
import 'package:foot_balls_sport/Widget/TopAssistPage.dart';
import 'package:foot_balls_sport/Widget/TopPlayerPage.dart';
import 'package:foot_balls_sport/Widget/TopRedCard.dart';
import 'package:foot_balls_sport/Widget/TopYellowCard.dart';

class Topplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Top Player 2022',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.shade100,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(text: 'Scorer'),
                    Tab(text: 'Assist'),
                    Tab(text: 'Red Card'),
                    Tab(text: 'Yellow Card'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TopPlayerPage(), 
            TopAssistPage(), 
            TopRedCardPage(),
            TopYellowCardPage(),
          ],
        ),
      ),
    );
  }
}

