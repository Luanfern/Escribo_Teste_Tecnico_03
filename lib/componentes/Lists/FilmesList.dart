import 'package:flutter/material.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';

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
          return const CardLists(
            corCard: Color.fromARGB(255, 150, 0, 0),
            name: 'Nome',
            type: 'Personagem',
            fav: false,
          );
        });
  }
}
