import '../../domain/domain.dart';
import '../repository/repository.dart';

class Update implements IUpdate {
  final IDatabaseRepository repository;

  Update(this.repository);

  @override
  Future<void> update({
    required int id,
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    return repository.update(id: id, data: data, tableName: tableName);
  }
}
