import 'package:avatar_customization_module/avatar_customization_module.dart';
import 'package:avatar_customization_module/src/domain/entities/avatar.dart';
import 'package:database_module/database_module.dart';
import 'interfaces/interfaces.dart';

class AvatarDatasourceRemote implements IAvatarDatasource {
  final DatabaseManager databaseManager;

  AvatarDatasourceRemote({required this.databaseManager});

  @override
  Future<bool> saveAvatar(Avatar avatar) async {
    try {
      var avatarDatabase = DatabaseAvatar(
        avatar: avatar.avatarString,
      );
      await databaseManager.avatarTable.createAvatar(avatarDatabase);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateAvatar(Avatar avatar, int id) async {
    try {
      await databaseManager.avatarTable.updateCurrentAvatar(id: 1, avatar: avatar.avatarString);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<Avatar>> currentAvatar(int id) async {
    try {
      final response = await databaseManager.avatarTable.getCurrentAvatar(id);
      var ret = response.map((item) => AvatarModel.fromMapBD(item).toDomain()).toList();
      return ret;
    } catch (e) {
      return [];
    }
  }
}
