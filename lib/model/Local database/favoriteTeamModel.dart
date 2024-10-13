class FavoriteTeam {
  final int id;
  final String name;
  final String logo;

  FavoriteTeam({required this.id, required this.name, required this.logo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  // Constructor dari Map
  factory FavoriteTeam.fromMap(Map<String, dynamic> map) {
    return FavoriteTeam(
      id: map['id'],
      name: map['name'],
      logo: map['logo'],
    );
  }
}
