import '../entities/entities.dart';

abstract class IUpdateAvatar {
  Future<void> update(Avatar params, int id);
}
