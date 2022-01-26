import 'package:flutter/material.dart';
import 'package:starwars_escribo/componentes/avatar.dart';
import 'package:starwars_escribo/componentes/botaosite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        body: Container(
          margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BtnSite(
                    title: 'Site Oficial',
                    link: 'https://www.starwars.com/community',
                    height: 40,
                    width: 150,
                  ),
                  Avatar(),
                ],
              )
            ],
          ),
        ));
  }
}
