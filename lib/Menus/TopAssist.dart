import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_topAssist.dart'; // Pastikan API sudah benar
import 'package:foot_balls_sport/model/TopAssistModel.dart'; // Import model yang benar

class TopAssistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Top Assist 2022",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TopAssist>>(
        future: TopAssistApi().getTopAssists(), // Pastikan API mengembalikan Future<List<TopAssist>>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load top assists'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No top assists available'));
          } else {
            final topAssists = snapshot.data!;
            return ListView.builder(
              itemCount: topAssists.length,
              itemBuilder: (context, index) {
                final player = topAssists[index];
                return ListTile(
                  leading: Image.network(player.player.photo),
                  title: Text(player.player.name),
                  subtitle: Text('Assists: ${player.statistic.assists}'),
                  trailing: Image.network(player.statistic.team.logo),
                );
              },
            );
          }
        },
      ),
    );
  }
}
