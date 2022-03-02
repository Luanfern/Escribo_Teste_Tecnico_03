import 'package:film_module/src/domain/domain.dart';

abstract class IFilmRepository {
  Future<List<Film>> fetchFilmsFromPage([int? page = 1]);

  Future<List<Film>> fetchFilmsFromDatabase();

  Future<bool> favoriteFilm(Film film);

  Future<bool> removefavoriteFilm(String name);
}
