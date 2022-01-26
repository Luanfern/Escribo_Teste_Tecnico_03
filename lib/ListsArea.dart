import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Provider/Pages.dart';

class ListsArea extends StatefulWidget {
  const ListsArea({ Key? key }) : super(key: key);

  @override
  _ListsAreaState createState() => _ListsAreaState();
}

class _ListsAreaState extends State<ListsArea> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodePaginas pages = Provider.of(context);
    return pages.getpage;
  }
}