import '../infra.dart';

import '../../domain/domain.dart';

class FetchFilmsFromDatabase implements IFetchFilmsFromDatabase {
  final IFilmRepository repository;

  FetchFilmsFromDatabase({required this.repository});

  @override
  Future<List<Film>> call() async {
    return repository.fetchFilmsFromDatabase();
  }
}
