import 'package:avatar_customization_module/src/domain/entities/avatar.dart';

import '../../domain/usecases/usecases.dart';
import '../repositories/repositories.dart';

class UpdateAvatar implements IUpdateAvatar {
  final IAvatarRepository repository;

  UpdateAvatar({required this.repository});

  @override
  Future<void> update(Avatar params, int id) {
    return repository.updateAvatar(params, id);
  }
}
