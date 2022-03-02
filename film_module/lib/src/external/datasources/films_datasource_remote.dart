import 'package:database_module/database_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:film_module/src/domain/entities/film.dart';
import 'package:film_module/src/infra/infra.dart';

import 'interfaces/interfaces.dart';

class FilmsDatasourceRemote implements IFilmsDatasource {
  final Dio api;
  final DatabaseManager databaseManager;

  FilmsDatasourceRemote({required this.api, required this.databaseManager});

  @override
  Future<bool> favoriteFilm(Film film) async {
    try {
      var filmdatabase = DatabaseFavorite(
        name: film.name,
        url: film.url,
      );
      await databaseManager.favoriteTable.createFavorite(filmdatabase);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<Film>> fetchFilmsFromPage([int? page = 1]) async {
    try {
      final response = await api.get('/films/?page=$page');
      final results = response.data['results'];
      final parse = (results as List).map((item) => FilmModel.fromMap(item).toDomain());
      return parse.toList();
    } on DioError catch (_) {
      return [];
    }
  }

  @override
  Future<List<Film>> fetchFilmsFromDatabase() async {
    try {
      final response = await databaseManager.favoriteTable.getAllFavorites();
      var ret = response.map((item) => FilmModel.fromMapBD(item).toDomain()).toList();
      return ret;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> removefavoriteFilm(String name) async {
    try {
      await databaseManager.favoriteTable.removeFavorite(name);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
