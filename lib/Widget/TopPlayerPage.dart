import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_topScorer.dart';
import 'package:foot_balls_sport/model/TopScorerModel.dart';

class TopPlayerPage extends StatelessWidget {
  const TopPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopScorer>>(
      future: TopPlayerApi().getTopScorers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load top players'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No top scorers available'));
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
    );
  }
}

