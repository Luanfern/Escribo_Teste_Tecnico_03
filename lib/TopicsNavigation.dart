import 'package:flutter/material.dart';

class TopicsNavigation extends StatefulWidget {
  const TopicsNavigation({Key? key}) : super(key: key);

  @override
  _TopicsNavigationState createState() => _TopicsNavigationState();
}

class _TopicsNavigationState extends State<TopicsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 30,
      child: Row(
        children: [
         Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'Filmes',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'Personagens',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'Favoritos',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
