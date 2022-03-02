import 'package:character_module/character_module.dart';
import 'package:character_module/src/domain/usecases/fetch_character_from_database.dart';
import 'package:character_module/src/infra/usecases/fetch_character_from_database.dart';
import 'package:dependency_module/dependency_module.dart';
import 'domain/usecases/remove_favorite_character.dart';
import 'external/datasources/interfaces/characters_datasource.dart';
import 'infra/usecases/remove_favorite_character.dart';
import 'presenter/store/character.store.dart';


class CharacterModular extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const CharacterPage()),
      ];

  List<Bind<Object>> get binds => [

        // Datasources
        Bind<ICharacterDatasource>(
          (i) => CharacterDatasourceRemote(api: i(), databaseManager: i()),
        export: true),
       
        // Repositories
        Bind<ICharacterRepository>(
          (i) => CharacterRepository(datasource: i()),
        export: true),

        // usecasses
        Bind<IFetchCharacterFromPage>(
          (i) => FetchCharacterFromPage(repository: i()),
        export: true),

        Bind<IFavoriteCharacter>(
          (i) => FavoriteCharacter(repository: i()),
        export: true),

        Bind<IFetchCharactersFromDatabase>(
          (i) => FetchCharactersFromDatabase(repository: i()),
        export: true),

        Bind<IRemoveFavoriteCharacter>(
          (i) => RemoveFavoriteCharacter(repository: i()),
        export: true),
       
        // Stores
        Bind(
          (i) => CharacterStore(favoriteCharacter: i(), fetchCharactersFromPage: i(), fetchCharactersFromDatabase: i(), removeFavoriteCharacter: i()),
        export: true),

        // Bind((i) => FilmStore( fetchFilms: i(), favoriteFilm: i()))
      ];
}
