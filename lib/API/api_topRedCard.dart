import 'dart:convert';
import 'package:foot_balls_sport/model/TopRedCardModel.dart';
import 'package:http/http.dart' as http;

class TopRedCardApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/players/topredcards?league=2&season=2022";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "ef1f1a8f97894d8bba6f56fc9d3f72ff",
  };

  Future<List<TopRedCard>> getTopRedCards() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> playerList = data['response'];
      return playerList
          .map((dynamic item) => TopRedCard.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load top red cards');
    }
  }
}