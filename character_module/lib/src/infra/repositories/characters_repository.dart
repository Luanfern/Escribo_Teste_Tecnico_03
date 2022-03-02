import '../../domain/domain.dart';

abstract class ICharacterRepository {
  Future<List<Character>> fetchCharacterFromPage([int? page = 1]);

  Future<bool> favoriteCharacter(Character character);

  Future<List<Character>> fetchCharacterFromDatabase();

  Future<bool> removefavoriteCharacter(String name);
}
