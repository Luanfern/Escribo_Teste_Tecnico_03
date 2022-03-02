abstract class IDatabaseRepository {
  
  Future<void> create({
    required Map<String, dynamic> data,
    required String tableName,
  });

  Future<List<Map<String, dynamic>>> read({
    required String tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  });

  Future<void> remove({
    String? name,
    required String tableName,
  });

  Future<void> update({
    required int id,
    required Map<String, dynamic> data,
    required String tableName,
  });
}
