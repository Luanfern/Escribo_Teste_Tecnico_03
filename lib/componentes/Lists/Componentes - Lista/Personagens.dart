import 'package:flutter/material.dart';

class Personagem extends StatefulWidget {
  const Personagem({ Key? key }) : super(key: key);

  @override
  _PersonagemState createState() => _PersonagemState();
}

class _PersonagemState extends State<Personagem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration:  BoxDecoration(
        color:const Color.fromARGB(255, 54, 54, 54),
        borderRadius: BorderRadius.circular(8),
        boxShadow:const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      height: 170,
    );
  }
}