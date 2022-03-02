import 'package:database_module/database_module.dart';
import 'package:dependency_module/dependency_module.dart';

import '../../domain/domain.dart';
import '../../infra/infra.dart';
import 'interfaces/interfaces.dart';

class CharacterDatasourceRemote implements ICharacterDatasource {
  final Dio api;
  final DatabaseManager databaseManager;

  CharacterDatasourceRemote({required this.api, required this.databaseManager});

  @override
  Future<bool> favoriteCharacter(Character character) async {
    try {
      var characterDatabase = DatabaseFavorite(
        name: character.name,
        url: character.url,
      );
      await databaseManager.favoriteTable.createFavorite(characterDatabase);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<Character>> fetchCharacterFromPage([int? page = 1]) async {
    try {
      final response = await api.get('/people/?page=$page');
      final results = response.data['results'];
      final parse = (results as List).map((item) => CharacterModel.fromMap(item));
      return parse.toList();
    } on DioError catch (_) {
      return [];
    }
  }

  @override
  Future<List<Character>> fetchCharacterFromDatabase() async {
    try {
      final response = await databaseManager.favoriteTable.getAllFavorites();
      var ret = response.map((item) => CharacterModel.fromMapBD(item).toDomain()).toList();
      return ret;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> removefavoriteCharacter(String name) async {
     try {
      await databaseManager.favoriteTable.removeFavorite(name);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
