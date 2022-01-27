import 'package:starwars_escribo/Network/Models/Personagens/PersonagensModel.dart';

class PersonagemPage {
  final int count;
  final String? next;
  final String? previous;
  final List<Personagem> results;

  const PersonagemPage({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PersonagemPage.fromJson(Map<String, dynamic> json) {
    return PersonagemPage(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results']
          .map<Personagem>((json) => Personagem.fromJson(json))
          .toList(),
    );
  }
}
