import 'package:starwars_escribo/Network/Models/Filmes/FilmesModel.dart';

class FilmesPage {
  final int count;
  final String? next;
  final String? previous;
  final List<Filme> results;

  const FilmesPage({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory FilmesPage.fromJson(Map<String, dynamic> json) {
    return FilmesPage(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results']
          .map<Filme>((json) => Filme.fromJson(json))
          .toList(),
    );
  }
}
