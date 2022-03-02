import 'package:avatar_customization_module/src/domain/entities/entities.dart';
abstract class IAvatarRepository {
  Future<bool> saveAvatar(Avatar avatar);

  Future<bool> updateAvatar(Avatar avatar, int id);

  Future<List<Avatar>> readCurrent(int id);
}
