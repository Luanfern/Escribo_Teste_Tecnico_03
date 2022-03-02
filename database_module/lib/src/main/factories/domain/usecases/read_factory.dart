import '../../../../domain/domain.dart';
import '../../../../infra/infra.dart';
import '../../../factories/infra/infra.dart';

/// Factory function to create implementations of `IRead` interface.
IRead makeRead() {
  return Read(makeDatabaseRepository());
}
