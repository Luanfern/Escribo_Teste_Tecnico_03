import 'domain/domain.dart';
import 'main/factories/factories.dart';
import 'presenter/presenter.dart';

class DatabaseManager {
  final AvatarTable avatarTable;

  final FavoriteTable favoriteTable;

  final IRead _read;

  final ICreate _create;

  final IUpdate _update;

  final IRemove _remove;

  DatabaseManager._(
    this._read,
    this._create,
    this._update,
    this._remove, {
    required this.avatarTable,
    required this.favoriteTable,
  });

  factory DatabaseManager() {
    return DatabaseManager._(
      makeRead(),
      makeCreate(),
      makeUpdate(),
      makeRemove(),
      avatarTable: makeAvatarTable(),
      favoriteTable: makeFavoritesTable(),
     
    );
  }

  Future<void> create({
    required Map<String, dynamic> data,
    required TableNames tableName,
  }) async {
    return _create.create(data: data, tableName: tableName.getString());
  }

  Future<List<Map<String, dynamic>>> read({
    required TableNames tableName,
    List<String>? selectColumns,
    dynamic whereKey,
    String? columnName,
  }) async {
    return _read.read(
      tableName: tableName.getString(),
      selectColumns: selectColumns,
      whereKey: whereKey,
      columnName: columnName,
    );
  }

  Future<void> remove({
    String? name,
    required TableNames tableName,
  }) async {
    return _remove.remove(name: name, tableName: tableName.getString());
  }

  Future<void> update({
    required int id,
    required Map<String, dynamic> data,
    required TableNames tableName,
  }) async {
    return _update.update(id: id, data: data, tableName: tableName.getString());
  }
}
