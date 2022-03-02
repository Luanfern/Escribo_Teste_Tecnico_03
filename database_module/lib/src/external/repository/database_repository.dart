import '../../infra/infra.dart';
import '../datasource/datasource.dart';

class DatabaseRepository implements IDatabaseRepository {
  final DatabaseAdapter database;

  DatabaseRepository(this.database);

  @override
  Future<void> create({
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    await database.saveData(tableName: tableName, data: data);
  }

  @override
  Future<List<Map<String, dynamic>>> read({
    required String tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  }) {
    return database.readData(
      tableName: tableName,
      selectColumns: selectColumns,
      whereKey: whereKey,
      columnName: columnName,
    );
  }

  @override
  Future<void> remove({
    String? name,
    required String tableName,
  }) async {
    await database.removeData(tableName: tableName, name: name);
  }

  @override
  Future<void> update({
    required int id,
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    await database.updateData(id: id, data: data, tableName: tableName);
  }
}
