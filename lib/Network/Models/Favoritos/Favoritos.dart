class Favorito {
  int? id;
  String? name;
  String? type;

  Favorito(
      {
      this.id,
      required this.name,
      required this.type,
      });

  Favorito.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
}