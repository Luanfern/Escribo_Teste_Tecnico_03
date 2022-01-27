import 'package:flutter/material.dart';

class CardLists extends StatefulWidget {
  final Color corCard;
  final String name;
  final String type;
  final bool? fav;
  const CardLists({
    Key? key,
    required this.corCard,
    required this.name,
    required this.type,
    this.fav,
  }) : super(key: key);

  @override
  _CardListsState createState() => _CardListsState();
}

class _CardListsState extends State<CardLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.corCard,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.type),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 2,
                ),
                Text(widget.name),
              ],
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
                child: const Center(
                  child: Icon(
                    //Icons.favorite_border_rounded,
                    Icons.favorite,
                    size: 40,
                    //color: Colors.white,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
