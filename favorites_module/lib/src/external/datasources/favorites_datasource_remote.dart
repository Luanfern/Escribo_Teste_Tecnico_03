import 'package:dependency_module/dependency_module.dart';
import 'package:favorites_module/src/domain/entities/favorite.dart';
import 'package:favorites_module/src/infra/models/models.dart';
import 'interfaces/interfaces.dart';
import 'package:database_module/database_module.dart';

class FavoritesDatasourceLocal implements IFavoritesDatasource {
  final Dio api;
  final DatabaseManager databaseManager;

  FavoritesDatasourceLocal({required this.api, required this.databaseManager});

  @override
  Future<List<Favorite>> fetchFavoritesFromDatabase() async {
    try {
      final response = await databaseManager.favoriteTable.getAllFavorites();
      var ret = response.map((item) => FavoriteModel.fromMapBD(item).toDomain()).toList();
      return ret;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> removefavorite(String name) async {
    try {
      await databaseManager.favoriteTable.removeFavorite(name);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
