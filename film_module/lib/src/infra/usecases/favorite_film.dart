import 'package:film_module/src/infra/infra.dart';

import '../../domain/domain.dart';

class FavoriteFilm implements IFavoriteFilm {
  final IFilmRepository repository;

  FavoriteFilm({required this.repository});

  @override
  Future<bool> call(Film film) async {
    return repository.favoriteFilm(film);
  }
}
