import 'package:flutter/material.dart';

class ListPersonagens extends StatefulWidget {
  const ListPersonagens({ Key? key }) : super(key: key);

  @override
  _ListPersonagensState createState() => _ListPersonagensState();
}

class _ListPersonagensState extends State<ListPersonagens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:const Center(
        child: Text('Lista de Personagens'),
      ),
    );
  }
}