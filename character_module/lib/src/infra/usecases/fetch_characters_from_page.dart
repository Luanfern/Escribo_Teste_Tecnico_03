import '../infra.dart';

import '../../domain/domain.dart';

class FetchCharacterFromPage implements IFetchCharacterFromPage {
  final ICharacterRepository repository;

  FetchCharacterFromPage({required this.repository});

  @override
  Future<List<Character>> call([int? page = 1]) async {
    return repository.fetchCharacterFromPage(page);
  }
}
