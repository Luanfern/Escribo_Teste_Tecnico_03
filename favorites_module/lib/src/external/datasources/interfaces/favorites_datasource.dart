import 'package:favorites_module/src/domain/entities/favorite.dart';

import '../../../domain/domain.dart';

abstract class IFavoritesDatasource {

  Future<List<Favorite>> fetchFavoritesFromDatabase();

  Future<bool> removefavorite(String name);
}
