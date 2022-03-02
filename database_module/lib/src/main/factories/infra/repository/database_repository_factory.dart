import '../../../../external/external.dart';
import '../../external/datasource/datasource.dart';

/// Factory function to create instances of `DatabaseRepository`.
DatabaseRepository makeDatabaseRepository() {
  return DatabaseRepository(makeDatabaseAdapter());
}
