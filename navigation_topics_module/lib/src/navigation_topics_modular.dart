import 'package:dependency_module/dependency_module.dart';
import '../navigation_topics_module.dart';

class NavigationTopicsModular extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => const NavigationTopics()),
  ];
}
