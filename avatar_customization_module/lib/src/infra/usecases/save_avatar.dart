import 'package:avatar_customization_module/src/domain/entities/entities.dart';

import '../../domain/usecases/usecases.dart';
import '../repositories/repositories.dart';

class SaveAvatar implements ISaveAvatar {
  final IAvatarRepository repository;

  SaveAvatar({required this.repository});

  @override
  Future<void> save(Avatar avatar) {
    return repository.saveAvatar(avatar);
  }
}
