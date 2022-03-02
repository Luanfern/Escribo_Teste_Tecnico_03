import 'package:dependency_module/dependency_module.dart';
import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import '../store/character.store.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    Key? key,
  }) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends ModularState<CharacterPage, CharacterStore> {
  @override
  void initState() {
    fetchCharacterfrompage();
    store.controllerScroll();
    super.initState();
  }

  fetchCharacterfrompage() async {
    await store.fetchCharacters(store.page);
  }

  void addorremoveDatabase(String name, String url, bool isAdd){
    if(isAdd == true){
      print('remover');
      store.removeFavoriteChar(name, url, false);
    }else{
      print('adicionar');
      store.saveFavoriteChar(name, url, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (store.isLoading && store.character.isEmpty) {
        return Container(
          color: Colors.black12,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 10),
                Text(
                  'Caregando...',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
        );
      } else {
        return Stack(
          children: [
            ListView(
              controller: store.controller,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 20),
              children: List.generate(
                store.character.length,
                (index) => DefaultCard(
                  name: store.character[index].name,
                  isFavorite: store.character[index].isFavorite,
                  cardColor: const Color.fromARGB(255, 54, 54, 54),
                  onFavorited: addorremoveDatabase,
                  url: store.character[index].url,
                  
                ),
              ),
            ),
            Visibility(
              visible: store.isLoading,
              child: Container(
                color: Colors.black12,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(height: 10),
                      Text(
                        'Caregando Mais...',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
