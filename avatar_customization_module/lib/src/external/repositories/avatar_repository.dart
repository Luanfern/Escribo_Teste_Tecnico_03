import '../../domain/entities/avatar.dart';
import '../../infra/infra.dart';
import '../datasources/interfaces/interfaces.dart';

class AvatarRepository implements IAvatarRepository {
  final IAvatarDatasource datasource;

  AvatarRepository({required this.datasource});

  @override
  Future<bool> saveAvatar(Avatar avatar) async {
    return datasource.saveAvatar(avatar);
  }

  @override
  Future<bool> updateAvatar(Avatar avatar, int id) async {
    return datasource.updateAvatar(avatar, id);
  }

  @override
  Future<List<Avatar>> readCurrent(int id) {
    return datasource.currentAvatar(id);
  }
}
