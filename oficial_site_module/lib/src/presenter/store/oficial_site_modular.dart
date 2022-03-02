import 'package:dependency_module/dependency_module.dart';

import '../page/oficial_site.dart';

class OficialSiteModule extends Module {
  @override

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SiteOficial()),
      ];

  List<Bind<Object>> get binds => [
      ];
}
