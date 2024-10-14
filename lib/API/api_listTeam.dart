import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Team>> fetchTeams() async {
  final response = await http.get(
    Uri.parse('https://v3.football.api-sports.io/teams?country=England'),
    headers: {
      'x-apisports-key': 'ef1f1a8f97894d8bba6f56fc9d3f72ff', // Ganti dengan API key kamu
    },
  );

  if (response.statusCode == 200) {
    // Parse the JSON response
    final jsonData = jsonDecode(response.body);
    final teams = jsonData['response'];

    // Create a list of Team objects
    return teams.map<Team>((team) => Team.fromJson(team)).toList();
  } else {
    throw Exception('Failed to load teams');
  }
}

class Team {
  final int id;
  final String name;
  final String logo;

  Team({required this.id, required this.name, required this.logo});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['team']['id'],
      name: json['team']['name'],
      logo: json['team']['logo'],
    );
  }
}
