import 'package:film_module/src/domain/entities/film.dart';
import 'package:film_module/src/external/datasources/interfaces/interfaces.dart';

import '../../infra/infra.dart';

class FilmRepository implements IFilmRepository {
  final IFilmsDatasource datasource;

  FilmRepository({required this.datasource});

  @override
  Future<bool> favoriteFilm(Film film) async {
    return datasource.favoriteFilm(film);
  }

  @override
  Future<List<Film>> fetchFilmsFromPage([int? page = 1]) async {
    return datasource.fetchFilmsFromPage(page);
  }

  @override
  Future<List<Film>> fetchFilmsFromDatabase() {
    return datasource.fetchFilmsFromDatabase();
  }

  @override
  Future<bool> removefavoriteFilm(String name) async {
    return datasource.removefavoriteFilm(name);
  }
}
