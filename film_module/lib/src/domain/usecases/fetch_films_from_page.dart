import 'package:film_module/src/domain/domain.dart';

abstract class IFetchFilmsFromPage {
  Future<List<Film>> call([int? page = 1]);
}
