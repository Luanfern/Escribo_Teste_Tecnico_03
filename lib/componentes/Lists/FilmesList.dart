import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Network/Models/Filmes/FilmesPageModel.dart';
import 'package:starwars_escribo/Network/Requests/FilmesRequest.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';

import '../../Provider/Filme.dart';

class ListFilmes extends StatefulWidget {
  const ListFilmes({Key? key}) : super(key: key);

  @override
  _ListFilmesState createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {
  ScrollController controller = ScrollController();
  late Future<FilmesPage> futureFilmes;
  int pageloc = 2;
  bool buscandomais = false;
  bool pararbusca = false;
  int maxinfo = 0;

  @override
  void initState() {
    super.initState();
    final GerenciamentodeFilmes filme =
        Provider.of(context, listen: false);
        maxinfo = filme.getmaxinfofilmes;
        pageloc = filme.getFilmePage;
        if (filme.getListfilmes.length >= maxinfo)
            {
              setState(() {
                pararbusca = true;
              });
            }
    controller.addListener(() {
      if (pararbusca == false) {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          if (buscandomais == false) {
            pegarmaisfilme();
          }
        }
      }
    });
  }

  pegarmaisfilme() {
    setState(() {
      buscandomais = true;
    });
    print('mais filmes');
    final GerenciamentodeFilmes filme =
        Provider.of(context, listen: false);
    futureFilmes = fetchFilmes(pageloc.toString());

    print('tamanho lista: ${filme.getListfilmes.length.toString()}');
    print('pagina buscada: ${filme.getFilmePage} -- ${pageloc.toString()}');
    int proxPagina = pageloc++;
    futureFilmes.then((value) => {
          filme.setListfilmes(
            filme.getListfilmes..addAll(value.results),
          ),
          filme.setFilmePage(proxPagina),
          print(
              'pagina a buscar: ${filme.getFilmePage} -- ${pageloc.toString()}'),
          setState(() {
            buscandomais = false;
          }),
          if (filme.getListfilmes.length >= maxinfo)
            {
              setState(() {
                pararbusca = true;
              }),
            },
          print('------------------------------------'),
          print(maxinfo),
          print(filme.getListfilmes.length),
          print('------------------------------------'),
        });
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodeFilmes filmes = Provider.of(context);
    return filmes.getListfilmes.length <= 1
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imgs/carregandogif.gif',
                  scale: 5,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Caregando...',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        : Stack(
            children: [
              ListView.builder(
                  controller: controller,
                  itemCount: filmes.getListfilmes.length,
                  itemBuilder: (ctx, i) {
                    return CardLists(
                      corCard: const Color.fromARGB(255, 150, 0, 0),
                      name: utf8.decode(filmes.getListfilmes[i].title!.codeUnits),
                      type: 'Filme',
                      fav: false,
                    );
                  }),
              Visibility(
                visible: buscandomais,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(97, 0, 0, 0),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imgs/carregandogif.gif',
                            scale: 5,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Caregando mais Personagens...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
