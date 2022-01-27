class Personagem {
  final String name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List? films;
  final List? species;
  final List? vehicles;
  final List? starships;
  final String? created;
  final String? edited;
  final String? url;

  const Personagem({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
        name: json['name'],
        height: json['height'],
        mass: json['mass'],
        hairColor: json['hair_color'],
        skinColor: json['skin_color'],
        eyeColor: json['eye_color'],
        birthYear: json['birth_year'],
        gender: json['gender'],
        homeworld: json['homeworld'],
        films: json['films'],
        species: json['species'],
        vehicles: json['vehicles'],
        starships: json['starships'],
        created: json['created'],
        edited: json['edited'],
        url: json['url'],
    );
  }

}
