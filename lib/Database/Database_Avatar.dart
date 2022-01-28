import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAvatar {  
  static const _databaseName = "AvatarDados.db";
  static const _databaseVersion = 1;
  static const table = 'Avatar';  
  static const columnId = 'id_avatar';
  static const columnAvatar = 'avatar';
  static const columnBackground = 'background';
  
  DatabaseAvatar._privateConstructor();
  static final DatabaseAvatar instance = DatabaseAvatar._privateConstructor();
  
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
  
    _database = await _initDatabase();
    return _database;
  }  
  
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }
  
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnAvatar TEXT NOT NULL,
            $columnBackground TEXT NOT NULL
          )
          ''');
  }  
  
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }
  
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
  
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
  
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}