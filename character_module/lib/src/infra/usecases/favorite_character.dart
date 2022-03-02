import '../../domain/domain.dart';
import '../infra.dart';

class FavoriteCharacter implements IFavoriteCharacter {
  final ICharacterRepository repository;

  FavoriteCharacter({required this.repository});

  @override
  Future<bool> call(Character character) async {
    return repository.favoriteCharacter(character);
  }
}
