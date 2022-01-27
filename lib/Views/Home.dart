import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Network/Models/Personagens/PersonagensPageModel.dart';
import 'package:starwars_escribo/Network/Requests/PersonagensRequest.dart';
import 'package:starwars_escribo/Provider/Personagem.dart';
import 'package:starwars_escribo/Views/Body.dart';
import 'package:starwars_escribo/Provider/Telas.dart';
import 'package:starwars_escribo/Views/SiteOficial.dart';
import 'package:starwars_escribo/componentes/avatar.dart';
import 'package:starwars_escribo/componentes/botaosite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<PersonagemPage> futurePersonagem;

  @override
  void initState() {
    super.initState();
    futurePersonagem = fetchPersonagens('');
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodeTelas telas = Provider.of(context);
    final GerenciamentodePersonagens perso = Provider.of(context);
    futurePersonagem.then((value) => {   
      perso.setListpersonagens(value.results),
      perso.setPersoPage(2),
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BtnSite(
                      title: 'Site Oficial',
                      link: 'https://www.starwars.com/community',
                      height: 40,
                      width: 150,
                      funcao: () {
                        if (telas.getsiteoficial == false) {
                          telas.getavatar == true ? telas.setavatar(false): null;
                          telas.settela(
                            const Expanded(
                              child: SiteOficial(),
                            ),
                          );
                          telas.setsiteoficial(true);
                          
                        } else {
                          telas.settela(
                            const Expanded(
                              child: CorpoApp(),
                            ),
                          );
                          telas.setsiteoficial(false);
                        }
                      },
                    ),
                    const Avatar(),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              telas.gettela
            ],
          ),
      ),
    );
  }
}
