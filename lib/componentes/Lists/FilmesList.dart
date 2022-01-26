import 'package:flutter/material.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/Filme.dart';

class ListFilmes extends StatefulWidget {
  const ListFilmes({Key? key}) : super(key: key);

  @override
  _ListFilmesState createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (ctx, i) {
          return const Filme();
        });
  }
}
