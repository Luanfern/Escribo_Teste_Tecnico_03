import 'package:dependency_module/dependency_module.dart';
import 'package:favorites_module/src/presenter/store/favorite.store.dart';
import '../favorites_module.dart';
import 'domain/usecases/fetch_favorites_from_database.dart';
import 'domain/usecases/remove_favorite.dart';
import 'external/datasources/interfaces/favorites_datasource.dart';
import 'infra/repositories/favorite_repository.dart';
import 'infra/usecases/usecases.dart';

class FavoriteModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind<IFavoritesDatasource>(
          (i) => FavoritesDatasourceLocal(api: i(), databaseManager: i()),
          export: true,
        ),

        // Repositories
        Bind<IFavoritesRepository>(
          (i) => FavoritesRepository(datasource: i()),
          export: true,
        ),

        // usecasses       
        Bind<IFetchFavoritesFromDatabase>(
          (i) => FetchFavoritesFromDatabase(repository: i()),
          export: true,
        ),

        Bind<IRemoveFavorite>(
          (i) => RemoveFavorite(repository: i()),
          export: true,
        ),

        // Stores
        Bind(
          (i) => FavoriteStore(fetchFavoritesFromDatabase: i(), removefavorite: i(),),
        export: true
        ),

        // Bind((i) => FilmStore( fetchFilms: i(), favoriteFilm: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const FavoritePage(),
        ),
      ];
}
