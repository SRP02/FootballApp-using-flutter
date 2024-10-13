import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_manager.dart';
import 'package:foot_balls_sport/Widget/Bodypage.dart';
import 'package:foot_balls_sport/Widget/TeamList.dart';
import 'package:foot_balls_sport/model/matchmodel.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Match & Team"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.shade100,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(text: 'Matches'),
                    Tab(text: 'Teams'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<SoccerMatch>>(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
              // Print the error message for debugging
              print("Error: ${snapshot.error}");
              return Center(
                child: Text("Error: ${snapshot.error}"), // Display the error message
              );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // Ensure the data is not null and is not empty
            print(snapshot.data!.length);
            return PageBody(snapshot.data!); 
          } else {
            return Center(
              child: Text("No matches found"),
            );
          }
        },
      ),
            TeamList()
          ],
        ),
      ),
    );
  }
}
