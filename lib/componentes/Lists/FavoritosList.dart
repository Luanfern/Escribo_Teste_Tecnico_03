import 'package:flutter/material.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';

class ListFavoritos extends StatefulWidget {
  const ListFavoritos({Key? key}) : super(key: key);

  @override
  _ListFavoritosState createState() => _ListFavoritosState();
}

class _ListFavoritosState extends State<ListFavoritos> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, i) {
          return const CardLists(
            corCard: Color.fromARGB(255, 54, 54, 54),
            name: 'Nome',
            type: 'Personagem',
          );
        });
  }
}