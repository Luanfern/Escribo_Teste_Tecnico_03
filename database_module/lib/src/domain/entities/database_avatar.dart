class DatabaseAvatar {

  final int? id;
  final String avatar;

  DatabaseAvatar({
    this.id,
    required this.avatar,
  });

  @override
  String toString() => 'DatabaseFavorite(id: $id, name: $avatar)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DatabaseAvatar &&
        other.id == id &&
        other.avatar == avatar;
  }

  @override
  int get hashCode => id.hashCode ^ avatar.hashCode;
}
