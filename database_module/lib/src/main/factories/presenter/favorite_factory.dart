import '../../../presenter/presenter.dart';
import '../domain/domain.dart';

FavoriteTable makeFavoritesTable() {
  return FavoriteTable(makeRead(), makeCreate(), makeRemove());
}
