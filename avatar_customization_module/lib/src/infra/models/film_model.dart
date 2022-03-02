

import 'package:avatar_customization_module/src/domain/entities/entities.dart';

class AvatarModel extends Avatar {
  AvatarModel({
    required String avatarString,
  }) : super('');

  factory AvatarModel.fromMapBD(Map<String, dynamic> map) {
    return AvatarModel(
      avatarString: map['avatarString'],
    );
  }

  AvatarModel toDomain() {
    return AvatarModel(
      avatarString: avatarString,
    );
  }
}
