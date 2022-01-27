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
  int pageloc = 0;
  //fazer
  bool buscandomais = false;

  @override
  void initState() {
    super.initState();
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
        pageloc = perso.getPersoPage;
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        pegarmaispersonagens();
      }
    });
  }

  pegarmaispersonagens() {
    print('mais personagens');
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    futurePersonagem = fetchPersonagens(pageloc.toString());

    print('tamanho lista: ${perso.getListpersonagens.length.toString()}');
    print('pagina buscada: ${perso.getPersoPage} -- ${pageloc.toString()}');
    int proxPagina = pageloc++;
    futurePersonagem.then(
      (value) =>{ perso.setListpersonagens(
        perso.getListpersonagens..addAll(value.results),
      ),
      perso.setPersoPage(proxPagina),   
      print('pagina a buscar: ${perso.getPersoPage} -- ${pageloc.toString()}'),

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodePersonagens perso = Provider.of(context);
    return perso.getListpersonagens.length <= 1 ? 
    const Center(
      child: CircularProgressIndicator(),
    )
    : ListView.builder(
        controller: controller,
        itemCount: perso.getListpersonagens.length,
        itemBuilder: (ctx, i) {
          return CardLists(
            corCard: const Color.fromARGB(255, 0, 150, 0),
            name: perso.getListpersonagens[i].name,
            type: 'Personagem',
            fav: false,
          );
        });
  }
}
