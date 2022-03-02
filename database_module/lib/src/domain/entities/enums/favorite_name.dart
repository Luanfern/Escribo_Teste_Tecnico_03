import '../../errors/database_exception.dart';

enum FavoriteTableColumn {
  id,
  name,
  url,
}

extension FavoriteTableColumnString on FavoriteTableColumn {
  String getString() {
    switch (this) {
      case FavoriteTableColumn.id:
        return 'id';
      case FavoriteTableColumn.name:
        return 'name';
      case FavoriteTableColumn.url:
        return 'url';
      default:
        throw DatabaseException('Invalid enum value: $this');
    }
  }
}
