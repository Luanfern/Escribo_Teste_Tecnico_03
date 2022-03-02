import 'package:favorites_module/src/domain/entities/favorite.dart';

abstract class IFavoritesRepository {
  Future<List<Favorite>> fetchFavoriteFromDatabase();

  Future<bool> removefavorite(String name);
}
