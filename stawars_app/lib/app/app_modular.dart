import 'package:database_module/database_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:film_module/film_module.dart';
import 'package:stawars_app/home/home_module.dart';
import 'package:character_module/character_module.dart';
import 'package:navigation_topics_module/navigation_topics_module.dart';
import 'package:favorites_module/favorites_module.dart';
import 'package:oficial_site_module/oficial_site_module.dart';
import 'package:avatar_customization_module/avatar_customization_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/avatarcustomization', child: (context,args) => const AvatarCustomization()),
        ChildRoute('/oficialsite', child: (context,args) => const SiteOficial()),
        ChildRoute('/', child: (_, __) => const HomePage(), children: [
          ModuleRoute('/films/', module: FilmModular()),
          ModuleRoute('/characters/', module: CharacterModular()),
          ModuleRoute('/favorites/', module: FavoriteModule()),
          //ModuleRoute('/favorites/', module: null),
        ]),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<Dio>(
          (i) => Dio(
            BaseOptions(
              baseUrl: "https://swapi.dev/api",
            ),
          ),
        ),
        Bind<DatabaseManager>(
          (i) => DatabaseManager(),
        )
      ];

  @override
  List<Module> get imports => [
        NavigationTopicsModular(),
        FilmModular(),
        CharacterModular(),
        FavoriteModule(),    
        OficialSiteModule(),
        AvatarCCustomizationModule(),
      ];
}
