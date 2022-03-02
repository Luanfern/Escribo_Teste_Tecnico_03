import '../infra.dart';

import '../../domain/domain.dart';

class FetchFilmsFromPage implements IFetchFilmsFromPage {
  final IFilmRepository repository;

  FetchFilmsFromPage({required this.repository});

  @override
  Future<List<Film>> call([int? page = 1]) async {
    return repository.fetchFilmsFromPage(page);
  }
}
