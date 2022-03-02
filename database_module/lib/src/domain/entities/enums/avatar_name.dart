import '../../errors/database_exception.dart';

enum AvatarTableColumn {
  id,
  avatar,
}

extension AvatarTableColumnString on AvatarTableColumn {
  String getString() {
    switch (this) {
      case AvatarTableColumn.id:
        return 'id';
      case AvatarTableColumn.avatar:
        return 'avatar';
      default:
        throw DatabaseException('Invalid enum value: $this');
    }
  }
}
