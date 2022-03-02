import '../../../domain/entities/entities.dart';

abstract class IAvatarDatasource {
  Future<bool> saveAvatar(Avatar avatar);

  Future<bool> updateAvatar(Avatar avatar, int id);

  Future<List<Avatar>> currentAvatar(int id);
}
