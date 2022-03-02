import '../entities/entities.dart';

abstract class IFavoriteFilm {
  Future<bool> call(Film film);
}
