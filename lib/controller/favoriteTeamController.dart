import 'package:get/get.dart';
import 'package:foot_balls_sport/database/database_helper.dart';
import 'package:foot_balls_sport/model/Local database/favoriteTeamModel.dart';
import 'package:foot_balls_sport/API/api_listTeam.dart'; // Model Team

class FavoriteTeamController extends GetxController {
  var favoriteTeams = <FavoriteTeam>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  // Load tim favorit dari database
  Future<void> loadFavorites() async {
    favoriteTeams.value = await _dbHelper.getFavorites();
  }

  // Cek apakah tim sudah ada di favorit
  bool isFavorite(Team team) {
    return favoriteTeams.any((favTeam) => favTeam.id == team.id);
  }

  // Tambah atau hapus tim dari favorit
void toggleFavorite(dynamic team) async {
  if (team is Team) {
    if (isFavorite(team)) {
      await _dbHelper.deleteFavorite(team.id);
      favoriteTeams.removeWhere((favTeam) => favTeam.id == team.id);
    } else {
      final favoriteTeam = FavoriteTeam(id: team.id, name: team.name, logo: team.logo);
      await _dbHelper.insertFavorite(favoriteTeam);
      favoriteTeams.add(favoriteTeam);
    }
  } else if (team is FavoriteTeam) {
    await _dbHelper.deleteFavorite(team.id);
    favoriteTeams.removeWhere((favTeam) => favTeam.id == team.id);
  }
}

void removeFavorite(FavoriteTeam favoriteTeam) async {
  await _dbHelper.deleteFavorite(favoriteTeam.id);
  favoriteTeams.removeWhere((favTeam) => favTeam.id == favoriteTeam.id);
}

}
