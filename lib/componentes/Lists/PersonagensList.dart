import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Network/Models/Personagens/PersonagensPageModel.dart';
import 'package:starwars_escribo/Network/Requests/PersonagensRequest.dart';
import 'package:starwars_escribo/Provider/Personagem.dart';
import 'package:starwars_escribo/componentes/Lists/Componentes%20-%20Lista/CardLists.dart';

class ListPersonagens extends StatefulWidget {
  const ListPersonagens({Key? key}) : super(key: key);

  @override
  _ListPersonagensState createState() => _ListPersonagensState();
}

class _ListPersonagensState extends State<ListPersonagens> {
  ScrollController controller = ScrollController();
  late Future<PersonagemPage> futurePersonagem;
  int pageloc = 1;
  bool buscandomais = false;
  bool pararbusca = false;
  int maxinfo = 0;

  @override
  void initState() {
    super.initState();
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    pageloc = perso.getPersoPage;
    controller.addListener(() {
      if (pararbusca == false) {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          if (buscandomais == false) {
            pegarmaispersonagens();
          }
        }
      }
    });
  }

  pegarmaispersonagens() {
    setState(() {
      buscandomais = true;
    });
    print('mais personagens');
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    futurePersonagem = fetchPersonagens(pageloc.toString());

    print('tamanho lista: ${perso.getListpersonagens.length.toString()}');
    print('pagina buscada: ${perso.getPersoPage} -- ${pageloc.toString()}');
    int proxPagina = pageloc++;
    futurePersonagem.then((value) => {
          perso.setListpersonagens(
            perso.getListpersonagens..addAll(value.results),
          ),
          perso.setPersoPage(proxPagina),
          print(
              'pagina a buscar: ${perso.getPersoPage} -- ${pageloc.toString()}'),
          
            if (perso.getListpersonagens.length == maxinfo) {
              setState(() {
                pararbusca = true;
              }),
            },
          setState(() {
            maxinfo = value.count;
            buscandomais = false;
          }),
          print('------------------------------------'),
          print(maxinfo),
          print(perso.getListpersonagens.length),
          print('------------------------------------'),
        });
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodePersonagens perso = Provider.of(context);
    return perso.getListpersonagens.length <= 1
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              ListView.builder(
                  controller: controller,
                  itemCount: perso.getListpersonagens.length,
                  itemBuilder: (ctx, i) {
                    return CardLists(
                      corCard: const Color.fromARGB(255, 0, 150, 0),
                      name: perso.getListpersonagens[i].name,
                      type: 'Personagem',
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
