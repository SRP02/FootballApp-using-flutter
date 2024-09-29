import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_manager.dart';
import 'package:foot_balls_sport/Widget/Bodypage.dart';
import 'package:foot_balls_sport/model/matchmodel.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "Match 2022",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SoccerMatch>>(
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
            return PageBody(snapshot.data!); // Use a null assertion operator
          } else {
            return Center(
              child: Text("No matches found"),
            );
          }
        },
      ),
    );
  }
}
