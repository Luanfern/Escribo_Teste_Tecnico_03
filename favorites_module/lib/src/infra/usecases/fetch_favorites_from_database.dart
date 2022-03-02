import 'package:favorites_module/src/domain/entities/favorite.dart';

import '../../domain/usecases/usecases.dart';
import '../repositories/repositories.dart';

class FetchFavoritesFromDatabase implements IFetchFavoritesFromDatabase {
  final IFavoritesRepository repository;

  FetchFavoritesFromDatabase({required this.repository});

  @override
  Future<List<Favorite>> call() async {
    return repository.fetchFavoriteFromDatabase();
  }
}
