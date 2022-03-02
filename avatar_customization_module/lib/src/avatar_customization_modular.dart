import 'package:avatar_customization_module/src/presenter/store/avatar.store.dart';
import 'package:dependency_module/dependency_module.dart';
import '../avatar_customization_module.dart';
import 'domain/usecases/save_avatar.dart';
import 'domain/usecases/update_avatar.dart';
import 'external/datasources/interfaces/avatar_datasource.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/page/avatar_customization.dart';

class AvatarCCustomizationModule extends Module {
  @override

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const AvatarCustomization()),
      ];

  List<Bind<Object>> get binds => [
        // Datasources
        Bind<IAvatarDatasource>(
          (i) => AvatarDatasourceRemote(databaseManager: i()),
          export: true,
        ),

        // Repositories
        Bind<IAvatarRepository>(
          (i) => AvatarRepository(datasource: i()),
          export: true,
        ),

        // usecasses

        Bind<ISaveAvatar>(
          (i) => SaveAvatar(repository: i()),
          export: true,
        ),

        Bind<IUpdateAvatar>(
          (i) => UpdateAvatar(repository: i()),
          export: true,
        ),

        Bind<ICurrentAvatar>(
          (i) => CurrentAvatar(repository: i()),
          export: true,
        ),

        // Stores
        Bind(
          (i) => AvatarStore(saveavatar: i(), updateavatar: i(), currentavatar: i()),
        export: true
        ),
      ];
}
