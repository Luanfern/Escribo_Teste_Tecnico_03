import 'package:film_module/src/domain/domain.dart';

abstract class IFetchFilmsFromDatabase {
  Future<List<Film>> call();
}
