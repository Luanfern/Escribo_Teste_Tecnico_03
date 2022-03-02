import 'package:flutter/material.dart';

class DefaultCard extends StatefulWidget {
  final Color cardColor;
  final String name;
  final String url;
  final bool isFavorite;

  final Function(String, String, bool)? onFavorited;

  const DefaultCard({
    Key? key,
    required this.cardColor,
    required this.name,
    required this.isFavorite,
    required this.onFavorited,
    required this.url,
  }) : super(key: key);

  @override
  State<DefaultCard> createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
  Color get _favoriteIconColor => widget.isFavorite ? Colors.red : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      height: 170,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  widget.onFavorited!(widget.name, widget.url ,widget.isFavorite);
                },
                child: Center(
                    child: Icon(
                  Icons.favorite,
                  size: 40,
                  color: _favoriteIconColor,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
