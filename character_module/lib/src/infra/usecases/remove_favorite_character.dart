import 'package:character_module/src/domain/usecases/remove_favorite_character.dart';

import '../../../character_module.dart';

class RemoveFavoriteCharacter implements IRemoveFavoriteCharacter {
  final ICharacterRepository repository;

  RemoveFavoriteCharacter({required this.repository});

  @override
  Future<bool> call(String name) async {
    return repository.removefavoriteCharacter(name);
  }
}
