import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Team>> fetchTeams() async {
  final response = await http.get(Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

  if (response.statusCode == 200) {
    // Parse the JSON response
    final jsonData = jsonDecode(response.body);
    final teams = jsonData['teams'];

    // Create a list of Team objects and convert the Iterable to List
    return teams.map<Team>((team) => Team.fromJson(team)).toList(); // .toList() is important here
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
      id: int.tryParse(json['idTeam'] ?? '0') ?? 0,
      name: json['strTeam'] ?? 'Unknown Team',
      logo: json['strBadge'] ?? '', // Ganti menjadi strBadge
    );
  }
}
