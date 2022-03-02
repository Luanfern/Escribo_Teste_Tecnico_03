import '../../../presenter/presenter.dart';
import '../domain/domain.dart';

AvatarTable makeAvatarTable() {
  return AvatarTable(makeRead(), makeCreate(), makeUpdate());
}
