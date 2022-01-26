import 'package:flutter/material.dart';

class ListFavoritos extends StatefulWidget {
  const ListFavoritos({ Key? key }) : super(key: key);

  @override
  _ListFavoritosState createState() => _ListFavoritosState();
}

class _ListFavoritosState extends State<ListFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:const Center(
        child: Text('Lista de Favoritos'),
      ),
    );
  }
}