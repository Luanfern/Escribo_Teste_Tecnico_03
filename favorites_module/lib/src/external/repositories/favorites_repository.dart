import 'package:favorites_module/src/domain/entities/entities.dart';
import 'package:favorites_module/src/infra/repositories/favorite_repository.dart';

import '../datasources/interfaces/favorites_datasource.dart';

class FavoritesRepository implements IFavoritesRepository {
  final IFavoritesDatasource datasource;

  FavoritesRepository({required this.datasource});

  @override
  Future<List<Favorite>> fetchFavoriteFromDatabase() {
    return datasource.fetchFavoritesFromDatabase();
  }

  @override
  Future<bool> removefavorite(String name) async {
    return datasource.removefavorite(name);
  }
}
