import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foot_balls_sport/model/TopScorerModel.dart';

class TopPlayerApi {
  final String apiUrl = "https://v3.football.api-sports.io/players/topscorers?league=39&season=2022";
  
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "ef1f1a8f97894d8bba6f56fc9d3f72ff"
  };

  Future<List<TopScorer>> getTopScorers() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> topScorersList = data['response'];
      return topScorersList.map((json) => TopScorer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load top scorers');
    }
  }
}
