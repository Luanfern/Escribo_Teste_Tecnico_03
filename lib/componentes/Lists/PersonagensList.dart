import 'package:flutter/material.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';

class ListPersonagens extends StatefulWidget {
  const ListPersonagens({ Key? key }) : super(key: key);

  @override
  _ListPersonagensState createState() => _ListPersonagensState();
}

class _ListPersonagensState extends State<ListPersonagens> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (ctx, i) {
          return const CardLists(
            corCard: Color.fromARGB(255, 0, 224, 37),
            name: 'Nome',
            type: 'Personagem',
            fav: false,
          );
        });
  }
}