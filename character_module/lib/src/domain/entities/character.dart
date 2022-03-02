class Character {  
  final String name;
  final String url;
  bool isFavorite;

  Character({
    required this.name,
    required this.url,
    this.isFavorite = false,
  });
}
