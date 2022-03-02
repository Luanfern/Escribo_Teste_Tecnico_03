import 'app_database.dart';

class DatabaseAdapter {
  final AppDatabase _appDatabase;

  DatabaseAdapter(this._appDatabase);

  Future<void> removeData({required String tableName, String? name}) async {
    final db = await _appDatabase.db;
    await db.delete(
      tableName,
      where: name == null ? null : 'name = ?',
      whereArgs: name == null ? null : [name],
    );
  }

  Future<void> saveData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final db = await _appDatabase.db;

    if (tableName == 'favorites') {
      await db.insert(tableName, data);
      return;
    }

    if (tableName == 'current_avatar') {
      await db.insert(tableName, data);
      return;
    }
    
  }

  Future<void> updateData({
    required int id,
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    final db = await _appDatabase.db;

    await db.update(
      tableName,
      data,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> readData({
    required String tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  }) async {
    final db = await _appDatabase.db;

    final result = await db.query(
      tableName,
      columns: selectColumns,
      where: columnName != null ? "$columnName = ?" : null,
      whereArgs: columnName != null ? [whereKey] : null,
    );

    return result;
  }
}
