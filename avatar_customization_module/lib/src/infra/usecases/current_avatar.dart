import 'package:avatar_customization_module/src/domain/entities/entities.dart';

import '../../domain/usecases/usecases.dart';
import '../repositories/repositories.dart';

class CurrentAvatar implements ICurrentAvatar {
  final IAvatarRepository repository;

  CurrentAvatar({required this.repository});

  @override
  Future<List<Avatar>> readCurrent(int id) {
    return repository.readCurrent(id);
  }

}