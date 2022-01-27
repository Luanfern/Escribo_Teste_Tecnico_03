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
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.type),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 2,
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 10, 10),
                            offset: Offset(0, 3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Saiba Mais',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 226, 225, 225),
                          ),
                        ),
                      ),
                    ),
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
