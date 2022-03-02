import 'package:film_module/film_module.dart';
import 'package:film_module/src/domain/domain.dart';

class FilmModel extends Film {
  FilmModel({
    required String name,
    required String url,
  }) : super(name: name, url: url);

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel(
      name: map['title'],
      url: map['url'],
    );
  }

  factory FilmModel.fromMapBD(Map<String, dynamic> map) {
    return FilmModel(
      name: map['name'],
      url: map['url'],
    );
  }

  Film toDomain() {
    return Film(
      name: name,
      url: url,
    );
  }
}
