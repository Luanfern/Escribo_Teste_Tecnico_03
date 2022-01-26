import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Provider/Pages.dart';
import 'package:starwars_escribo/componentes/Lists/FavoritosList.dart';
import 'package:starwars_escribo/componentes/Lists/FilmesList.dart';
import 'package:starwars_escribo/componentes/Lists/PersonagensList.dart';

class TopicsNavigation extends StatefulWidget {
  const TopicsNavigation({Key? key}) : super(key: key);

  @override
  _TopicsNavigationState createState() => _TopicsNavigationState();
}

class _TopicsNavigationState extends State<TopicsNavigation> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodePaginas pages = Provider.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 30,
      child: Row(
        children: [
         Expanded(
            child: GestureDetector(
              onTap: (){
                print("filmes");
                pages.setpage(const ListFilmes());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Filmes',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                print("pers");
                pages.setpage(const ListPersonagens());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Personagens',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child:GestureDetector(
              onTap: (){
                print("fav");
                pages.setpage(const ListFavoritos());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Favoritos',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
