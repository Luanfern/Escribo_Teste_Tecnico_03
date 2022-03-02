import '../../domain/domain.dart';
import '../repository/repository.dart';

class Remove implements IRemove {
  final IDatabaseRepository repository;
  
  Remove(this.repository);

  @override
  Future<void> remove({
    String? name,
    required String tableName,
  }) async {
    return repository.remove(name: name, tableName: tableName);
  }
}
