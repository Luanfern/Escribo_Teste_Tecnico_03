import '../../../character_module.dart';

abstract class IFavoriteCharacter {
  Future<bool> call(Character character);
}
