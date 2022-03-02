import 'package:character_module/character_module.dart';

abstract class IFetchCharactersFromDatabase {
  Future<List<Character>> call();
}
