import 'package:film_module/src/infra/infra.dart';

import '../../domain/domain.dart';

class RemoveFavoriteFilm implements IRemoveFavoriteFilm {
  final IFilmRepository repository;

  RemoveFavoriteFilm({required this.repository});

  @override
  Future<bool> call(String name) async {
    return repository.removefavoriteFilm(name);
  }
}
