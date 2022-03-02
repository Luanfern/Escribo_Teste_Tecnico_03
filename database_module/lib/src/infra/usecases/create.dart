import '../../domain/domain.dart';
import '../repository/repository.dart';

class Create implements ICreate {
  final IDatabaseRepository repository;

  Create(this.repository);

  @override
  Future<void> create({
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    return repository.create(data: data, tableName: tableName);
  }
}
