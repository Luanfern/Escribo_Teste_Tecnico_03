class Favorito {
  String? id;
  String? name;
  String? type;

  Favorito(
      {
      required this.id,
      required this.name,
      required this.type,
      });

  Favorito.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
}