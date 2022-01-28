import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';
import '../../Provider/Favoritos.dart';

class ListFavoritos extends StatefulWidget {
  const ListFavoritos({Key? key}) : super(key: key);

  @override
  _ListFavoritosState createState() => _ListFavoritosState();
}

class _ListFavoritosState extends State<ListFavoritos> {

  @override
  Widget build(BuildContext context) {
    final GerenciamentodeFavoritos favoritos = Provider.of(context);
    return ListView.builder(
        itemCount: favoritos.getListfavoritos.length,
        itemBuilder: (ctx, i) {
          return  CardLists(
            corCard: favoritos.getListfavoritos[i].type! == 'Filme' ? const Color.fromARGB(255, 150, 0, 0): const Color.fromARGB(255, 0, 150, 0),
            name: favoritos.getListfavoritos[i].name!,
            type: favoritos.getListfavoritos[i].type!,
            fav: true,
          );
        });
  }
}
