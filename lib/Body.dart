import 'package:flutter/material.dart';
import 'package:starwars_escribo/ListsArea.dart';
import 'package:starwars_escribo/TopicsNavigation.dart';

class CorpoApp extends StatefulWidget {
  const CorpoApp({Key? key}) : super(key: key);

  @override
  _CorpoAppState createState() => _CorpoAppState();
}

class _CorpoAppState extends State<CorpoApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopicsNavigation(),
        Expanded(
          child: ListsArea(),
        ),
      ],
    );
  }
}
