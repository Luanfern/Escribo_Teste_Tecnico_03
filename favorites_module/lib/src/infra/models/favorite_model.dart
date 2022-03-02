import '../../domain/entities/entities.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({
    required String name,
    required String url,
  }) : super(name: name, url: url);

  factory FavoriteModel.fromMapBD(Map<String, dynamic> map) {
    return FavoriteModel(
      name: map['name'],
      url: map['url'],
    );
  }

  Favorite toDomain() {
    return Favorite(
      name: name,
      url: url,
    );
  }
}
