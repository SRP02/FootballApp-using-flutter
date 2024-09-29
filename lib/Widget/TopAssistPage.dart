import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_topAssist.dart';
import 'package:foot_balls_sport/model/TopAssistModel.dart';

class TopAssistPage extends StatelessWidget {
  const TopAssistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopAssist>>(
      future: TopAssistApi().getTopAssists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load top assists'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No top assists available'));
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
    );
  }
}
