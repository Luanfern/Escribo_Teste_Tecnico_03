import 'package:favorites_module/src/infra/repositories/repositories.dart';

import '../../domain/usecases/usecases.dart';

class RemoveFavorite implements IRemoveFavorite {
  final IFavoritesRepository repository;

  RemoveFavorite({required this.repository});

  @override
  Future<bool> call(String name) async {
    return repository.removefavorite(name);
  }
}
