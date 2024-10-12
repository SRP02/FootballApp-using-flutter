import 'package:flutter/material.dart';
import 'package:foot_balls_sport/API/api_listTeam.dart';

class TeamList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: fetchTeams(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No teams found"));
        } else {
          return 
          
          ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final team = snapshot.data![index];
              final teamName = team.name.isNotEmpty ? team.name : 'Unknown Team';
              final teamLogo = team.logo.isNotEmpty ? team.logo : '';

              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text(teamName),
                  leading: teamLogo.isNotEmpty 
                    ? Image.network(
                        teamLogo,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.sports_soccer); // Default icon if image fails to load
                        },
                      )
                    : Icon(Icons.sports_soccer), // Default icon if no logo
                ),
              );
            },
          );
        }
      },
    );
  }
}
