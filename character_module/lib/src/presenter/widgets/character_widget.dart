import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final String title;
  final int id;
  final bool isFavorite;

  Color get _favoriteIconColor => isFavorite ? Colors.red : Colors.white;

  // Calback pra favoritar
  final Function(int id)? onFavorited;

  const CharacterWidget({
    Key? key,
    required this.title,
    required this.id,
    required this.isFavorite,
    this.onFavorited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onFavorited?.call(id);
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 5),
        child: ListTile(
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.redAccent,
          title: Text(title),
          trailing: Icon(Icons.favorite, color: _favoriteIconColor),
        ),
      ),
    );
  }
}
