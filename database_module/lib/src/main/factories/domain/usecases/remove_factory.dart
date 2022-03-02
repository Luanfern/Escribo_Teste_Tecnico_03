import '../../../../domain/domain.dart';
import '../../../../infra/infra.dart';
import '../../../factories/infra/infra.dart';

/// Factory function to create implementations of `IRemove` interface.
IRemove makeRemove() {
  return Remove(makeDatabaseRepository());
}
