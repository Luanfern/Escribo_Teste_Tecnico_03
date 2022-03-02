import '../entities/entities.dart';

abstract class IFetchCharacterFromPage {
  Future<List<Character>> call([int? page = 1]);
}
