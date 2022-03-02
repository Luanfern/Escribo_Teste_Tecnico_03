import 'package:avatar_customization_module/src/domain/entities/entities.dart';

abstract class ICurrentAvatar {
  Future<List<Avatar>> readCurrent(int id);
}
