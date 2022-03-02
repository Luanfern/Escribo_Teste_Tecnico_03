abstract class IRead {
  Future<List<Map<String, dynamic>>> read({
    required String tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  });
}
