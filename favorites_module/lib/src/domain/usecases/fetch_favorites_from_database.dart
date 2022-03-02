import 'package:favorites_module/src/domain/entities/favorite.dart';

abstract class IFetchFavoritesFromDatabase {
  Future<List<Favorite>> call();
}
