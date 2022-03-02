class Film {
  final String name;
  final String url;
  final bool isFavorite;

  Film({
    required this.name,
    required this.url,
    this.isFavorite = false,
  });
}
