import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE MOVIE (
            id TEXT PRIMARY KEY,
            path TEXT
          )
        ''');
      },
    );
  }

  Future<void> addItemToDatabase(String id, String path) async {
    final Database db = await database;
    await db.insert(
      'MOVIE',
      {'id': id, 'path': path},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> checkItemAvailability(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'MOVIE',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getAllItemsFromDatabase() async {
    final Database db = await database;
    return await db.query('MOVIE');
  }

  Future<void> deleteItemById(String id) async {
    final Database db = await database;
    await db.delete(
      'MOVIE',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class MovieLocalData {
  final String id;
  final String path;

  MovieLocalData({required this.id, required this.path});

  factory MovieLocalData.fromJson(Map<String, dynamic> json) {
    return MovieLocalData(id: json['id'], path: json['path']);
  }
}
