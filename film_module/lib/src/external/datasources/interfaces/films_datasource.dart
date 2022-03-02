import '../../../domain/domain.dart';

abstract class IFilmsDatasource {
  Future<List<Film>> fetchFilmsFromPage([int? page = 1]);

  Future<List<Film>> fetchFilmsFromDatabase();

  Future<bool> favoriteFilm(Film film);

  Future<bool> removefavoriteFilm(String name);
}
