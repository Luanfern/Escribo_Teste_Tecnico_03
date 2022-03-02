import 'package:dependency_module/dependency_module.dart';
import 'package:film_module/film_module.dart';
import 'package:film_module/src/external/datasources/interfaces/interfaces.dart';
import 'package:film_module/src/infra/usecases/fetch_films_from_database.dart';
import 'presenter/store/film.store.dart';

class FilmModular extends Module {
  @override

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const FilmPage()),
      ];

  List<Bind<Object>> get binds => [
        // Datasources
        Bind<IFilmsDatasource>(
          (i) => FilmsDatasourceRemote(api: i(), databaseManager: i()),
          export: true,
        ),

        // Repositories
        Bind<IFilmRepository>(
          (i) => FilmRepository(datasource: i()),
          export: true,
        ),

        // usecasses
        Bind<IFetchFilmsFromPage>(
          (i) => FetchFilmsFromPage(repository: i()),
          export: true,
          ),

        Bind<IFavoriteFilm>(
          (i) => FavoriteFilm(repository: i()),
          export: true,
        ),

        Bind<IFetchFilmsFromDatabase>(
          (i) => FetchFilmsFromDatabase(repository: i()),
          export: true,
        ),

        Bind<IRemoveFavoriteFilm>(
          (i) => RemoveFavoriteFilm(repository: i()),
          export: true,
        ),

        // Stores
        Bind(
          (i) => FilmStore(favoriteFilm: i(), fetchFilmsFromPage: i(), fetchFilmsFromDatabase: i(), removefavoriteFilm: i()),
        export: true
        ),

        // Bind((i) => FilmStore( fetchFilms: i(), favoriteFilm: i()))
      ];
}
