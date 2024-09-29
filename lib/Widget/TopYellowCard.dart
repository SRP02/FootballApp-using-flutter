import 'package:flutter/material.dart';
import 'package:foot_balls_sport/model/TopYellowCardModel.dart';
import 'package:foot_balls_sport/API/api_topYellowCard.dart';


class TopYellowCardPage extends StatelessWidget {
  const TopYellowCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopYellowCard>>(
      future: TopYellowCardApi().getTopYellowCards(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load top players'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No top players available'));
        } else {
          final topPlayers = snapshot.data!;
          return ListView.builder(
            itemCount: topPlayers.length,
            itemBuilder: (context, index) {
              final player = topPlayers[index];
              return ListTile(
                leading: Image.network(player.player.photo),
                title: Text(player.player.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Yellow cards: ${player.statistic.yellowCards}'),
                  ],
                ),
                trailing: Image.network(player.statistic.team.logo),
              );
            },
          );
        }
      },
    );
  }
}
