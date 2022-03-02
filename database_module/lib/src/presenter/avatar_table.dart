import '../domain/domain.dart';

class AvatarTable {
  final IRead _read;
  final ICreate _create;
  final IUpdate _update;

  AvatarTable(this._read, this._create, this._update);

  Future<void> createAvatar(DatabaseAvatar avatar) async {
    final studentMap = {
      AvatarTableColumn.id.getString(): avatar.id,
      AvatarTableColumn.avatar.getString(): avatar.avatar,
    };

    try {
      await _create.create(
        data: studentMap,
        tableName: TableNames.currentAvatar.getString(),
      );
    } catch (_) {
      throw DatabaseException('Create avatar (id: ${avatar.id}) error');
    }
  }

  Future<List<Map<String, dynamic>>> getCurrentAvatar(
    int id,
  ) async {
    try {
      return _read.read(
        tableName: TableNames.currentAvatar.getString(),
        whereKey: id,
        columnName: AvatarTableColumn.id.getString(),
        selectColumns: [AvatarTableColumn.avatar.getString()],
      );
    } catch (_) {
      throw DatabaseException('Read student (id: $id) avatar error');
    }
  }

  Future<void> updateCurrentAvatar({
    required int id,
    required String avatar,
  }) async {
    try {
      return _update.update(
        id: id,
        data: {AvatarTableColumn.avatar.getString(): avatar},
        tableName: TableNames.currentAvatar.getString(),
      );
    } catch (_) {
      throw DatabaseException('Update student (id: $id) avatar error');
    }
  }
}
