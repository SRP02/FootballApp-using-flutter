class TopScorer {
  Player player;
  Statistic statistic;

  TopScorer(this.player, this.statistic);

  factory TopScorer.fromJson(Map<String, dynamic> json) {
    return TopScorer(
      Player.fromJson(json['player']),
      Statistic.fromJson(json['statistics'][0]), // Ambil data pertama dari statistik
    );
  }
}

class Player {
  int id;
  String name;
  String photo;

  Player(this.id, this.name, this.photo);

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      json['id'],
      json['name'],
      json['photo'],
    );
  }
}

class Statistic {
  Team team;
  Goals goals;

  Statistic(this.team, this.goals);

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      Team.fromJson(json['team']),
      Goals.fromJson(json['goals']),
    );
  }
}

class Team {
  int id;
  String name;
  String logo;

  Team(this.id, this.name, this.logo);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      json['id'],
      json['name'],
      json['logo'],
    );
  }
}

class Goals {
  int total;

  Goals(this.total);

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      json['total'],
    );
  }
}
