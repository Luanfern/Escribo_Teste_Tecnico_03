import '../../domain/domain.dart';
import '../../infra/infra.dart';
import '../datasources/interfaces/characters_datasource.dart';

class CharacterRepository implements ICharacterRepository {
  final ICharacterDatasource datasource;

  CharacterRepository({required this.datasource});

  @override
  Future<bool> favoriteCharacter(Character character) async {
    return datasource.favoriteCharacter(character);
  }

  @override
  Future<List<Character>> fetchCharacterFromPage([int? page = 1]) async {
    return datasource.fetchCharacterFromPage(page);
  }

  @override
  Future<List<Character>> fetchCharacterFromDatabase() {
    return datasource.fetchCharacterFromDatabase();
  }

  @override
  Future<bool> removefavoriteCharacter(String name) {
    return datasource.removefavoriteCharacter(name);
  }
}
