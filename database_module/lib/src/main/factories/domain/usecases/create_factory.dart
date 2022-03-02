import '../../../../domain/domain.dart';
import '../../../../infra/infra.dart';
import '../../../factories/infra/infra.dart';

/// Factory function to create implementations of `ICreate` interface.
ICreate makeCreate() {
  return Create(makeDatabaseRepository());
}
