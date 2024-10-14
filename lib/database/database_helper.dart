import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:foot_balls_sport/model/Local database/favoriteTeamModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorite_teams.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, name TEXT, logo TEXT)',
        );
      },
    );
  }

  Future<void> insertFavorite(FavoriteTeam team) async {
    final db = await database;
    await db.insert(
      'favorites',
      team.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FavoriteTeam>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return FavoriteTeam.fromMap(maps[i]);
    });
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
