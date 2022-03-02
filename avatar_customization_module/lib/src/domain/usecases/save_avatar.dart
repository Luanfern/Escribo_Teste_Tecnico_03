import 'package:avatar_customization_module/src/domain/entities/entities.dart';

abstract class ISaveAvatar {
  Future<void> save(Avatar avatar);
}
