class Favorite {
  final String name;
  final String url;
  final bool isFavorite;

  Favorite({
    required this.name,
    required this.url,
    this.isFavorite = false,
  });
}
