import '../../errors/database_exception.dart';

enum TableNames {
  favorites,
  currentAvatar,
}

extension TableNameString on TableNames {
  String getString() {
    switch (this) {
      case TableNames.favorites:
        return 'favorites';
      case TableNames.currentAvatar:
        return 'current_avatar';
      default:
        throw DatabaseException('Invalid enum value: $this');
    }
  }
}
