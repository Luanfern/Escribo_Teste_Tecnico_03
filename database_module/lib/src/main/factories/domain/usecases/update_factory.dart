import '../../../../domain/domain.dart';
import '../../../../infra/infra.dart';
import '../../../factories/infra/infra.dart';

/// Factory function to create implementations of `IUpdate` interface.
IUpdate makeUpdate() {
  return Update(makeDatabaseRepository());
}
