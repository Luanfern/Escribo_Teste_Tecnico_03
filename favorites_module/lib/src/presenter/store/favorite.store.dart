import 'package:dependency_module/dependency_module.dart';
import 'package:favorites_module/src/domain/entities/entities.dart';

import '../../domain/usecases/fetch_favorites_from_database.dart';
import '../../domain/usecases/remove_favorite.dart';

part 'favorite.store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
    late final IFetchFavoritesFromDatabase fetchFavoritesFromDatabase;
  late final IRemoveFavorite removefavorite;

  _FavoriteStore({
    required this.fetchFavoritesFromDatabase,
    required this.removefavorite,
  });

  @observable
  List<Favorite> favorites = [];

  @observable
  bool isLoading = true;

  @action
  Future<void> removeFavorite(String name) async {
    isLoading = true;
    
    await removefavorite(name);
    favorites.remove(favorites.firstWhere((element) => element.name == name));

    isLoading = false;
  }

  @action
  Future<void> fetchFavorites() async {
    isLoading = true;
    List<Favorite> provisionalfavorites = [];

    final fetchfavoritefilmsreturn = await fetchFavoritesFromDatabase();
    provisionalfavorites.addAll(fetchfavoritefilmsreturn);   


    provisionalfavorites.forEach((element) {
      favorites.add(Favorite(name: element.name, url: element.url, isFavorite: true));
    });   

    isLoading = false;
  }

  void dispose() {
    favorites = [];
  }
}
