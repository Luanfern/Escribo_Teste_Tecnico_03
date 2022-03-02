import '../../domain/domain.dart';
import '../repository/repository.dart';
class Read implements IRead {
  final IDatabaseRepository repository;

  Read(this.repository);

  @override
  Future<List<Map<String, dynamic>>> read({
    required String tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  }) async {
    return repository.read(
      tableName: tableName,
      selectColumns: selectColumns,
      whereKey: whereKey,
      columnName: columnName,
    );
  }
}
