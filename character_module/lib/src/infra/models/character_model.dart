import '../../domain/entities/entities.dart';

class CharacterModel extends Character {
  CharacterModel({
    required String name,
    required String url,
  }) : super(name: name, url: url);

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'],
      url: map['url'],
    );
  }

  factory CharacterModel.fromMapBD(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'],
      url: map['url'],
    );
  }

  Character toDomain() {
    return Character(
      name: name,
      url: url,
    );
  }
}
