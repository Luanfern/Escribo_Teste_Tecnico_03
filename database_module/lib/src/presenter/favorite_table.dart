import '../domain/domain.dart';

class FavoriteTable {
  final IRead _read;
  final ICreate _create;
  final IRemove _remove;

  FavoriteTable(this._read, this._create, this._remove);

  Future<void> createFavorite(DatabaseFavorite favorite) async {
    final studentMap = {
      FavoriteTableColumn.id.getString(): favorite.id,
      FavoriteTableColumn.name.getString(): favorite.name,
      FavoriteTableColumn.url.getString(): favorite.url,
    };

    try {
      await _create.create(
        data: studentMap,
        tableName: TableNames.favorites.getString(),
      );
    } catch (_) {
      throw DatabaseException('Create favorite (id: ${favorite.id}) error');
    }
  }

  Future<void> removeFavorite(String name) async {
    try {
      await _remove.remove(
        name: name,
        tableName: TableNames.favorites.getString(),
      );
    } catch (_) {
      throw DatabaseException('Remove favorites error');
    }
  }

  Future<List<Map<String, dynamic>>> getAllFavorites() async {
    try {
      return _read.read(
        tableName: TableNames.favorites.getString(),
        selectColumns: [
          FavoriteTableColumn.id.getString(),
          FavoriteTableColumn.name.getString(),
          FavoriteTableColumn.url.getString(),
        ],
      );
    } catch (_) {
      throw DatabaseException('Read favorites error');
    }
  }


}
