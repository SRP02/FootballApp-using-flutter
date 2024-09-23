import 'dart:convert';
import 'package:foot_balls_sport/model/matchmodel.dart';
import 'package:http/http.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "bd6309c0ba436e47679201e150a4a6c2"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    } else {
      // Handle error case
      return [];
    }
  }
}
