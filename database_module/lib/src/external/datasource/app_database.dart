import 'package:dependency_module/dependency_module.dart';

class AppDatabase {
  factory AppDatabase() => _instance;

  AppDatabase._();

  static final AppDatabase _instance = AppDatabase._();

  Database? _db;

  Future<Database> get db async => _db ?? await _initDb();

  Future<void> _createFavoriteTable(Database db) async {
    await db.execute(
      '''
        CREATE TABLE favorites(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          url TEXT,
        );
      ''',
    );
  }

  Future<void> _createAvatarTable(Database db) async {
    await db.execute(
      '''
        CREATE TABLE current_avatar(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          avatar TEXT
        );
      ''',
    );
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      './DatabaseStarWars.db',
      version: 1,
      onCreate: (Database db, int currentVersion) async {
        await _createFavoriteTable(db);
        await _createAvatarTable(db);
        
      },
    );
  }
}
