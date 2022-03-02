class DatabaseFavorite {

  final int? id;
  final String name;
  final String url;

  DatabaseFavorite({
    this.id,
    required this.name,
    required this.url,
  });

  @override
  String toString() => 'DatabaseFavorite(id: $id, name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DatabaseFavorite &&
        other.id == id &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ url.hashCode;
}
