import '../../../../external/external.dart';
import 'app_database_factory.dart';

DatabaseAdapter makeDatabaseAdapter() {
  return DatabaseAdapter(makeAppDatabase());
}
