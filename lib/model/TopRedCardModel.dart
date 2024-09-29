class TopRedCard {
  Player player;
  Statistic statistic;

  TopRedCard({required this.player, required this.statistic});

  factory TopRedCard.fromJson(Map<String, dynamic> json) {
    return TopRedCard(
      player: Player.fromJson(json['player']),
      statistic: Statistic.fromJson(json['statistics'][0]), // Ambil statistik pertama
    );
  }
}

class Player {
  int id;
  String name;
  String photo;

  Player({required this.id, required this.name, required this.photo});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

class Statistic {
  Team team;
  int redCards;

  Statistic({required this.team, required this.redCards});

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      team: Team.fromJson(json['team']),
      redCards: json['cards']['red'] ?? 0,
    );
  }
}

class Team {
  int id;
  String name;
  String logo;

  Team({required this.id, required this.name, required this.logo});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
}