import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_topScorer.dart';
import 'package:foot_balls_sport/model/TopScorerModel.dart';

class TopPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Top Scorer 2022",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TopScorer>>(
        future: TopPlayerApi().getTopScorers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load top players'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No top scorers available'));
          } else {
            final topScorers = snapshot.data!;
            return ListView.builder(
              itemCount: topScorers.length,
              itemBuilder: (context, index) {
                final scorer = topScorers[index];
                return ListTile(
                  leading: Image.network(scorer.player.photo),
                  title: Text(scorer.player.name),
                  subtitle: Text('Goals: ${scorer.statistic.goals.total}'),
                  trailing: Image.network(scorer.statistic.team.logo),
                );
              },
            );
          }
        },
      ),
    );
  }
}
