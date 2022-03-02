import 'package:character_module/src/domain/usecases/fetch_character_from_database.dart';

import '../infra.dart';

import '../../domain/domain.dart';

class FetchCharactersFromDatabase implements IFetchCharactersFromDatabase {
  final ICharacterRepository repository;

  FetchCharactersFromDatabase({required this.repository});

  @override
  Future<List<Character>> call() async {
    return repository.fetchCharacterFromDatabase();
  }
}
