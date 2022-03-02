import 'package:dependency_module/dependency_module.dart';
import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import '../store/film.store.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({
    Key? key,
  }) : super(key: key);

  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends ModularState<FilmPage, FilmStore> {
  @override
  void initState() {
    fetchfilmsfrompage();
    super.initState();
  }

  fetchfilmsfrompage() async {
    await store.fetchFilms();
    print('initState()');
  }

  void addorremoveDatabase(String name, String url, bool isAdd){
    if(isAdd == true){
      print('remover');
      store.removeFavoriteFIlm(name, url, false);
    }else{
      print('adicionar');
      store.saveFavoriteFIlm(name, url, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      store.films.forEach((element) { print(element.name + ' - '+ element.isFavorite.toString()); });
      if (store.isLoading) {
        return Container(
          color: Colors.black12,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 10),
                Text(
                  'Caregando...',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
        );
      } else {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 20),
          children: List.generate(
            store.films.length,
            (index) => DefaultCard(
              name: store.films[index].name,
              isFavorite: store.films[index].isFavorite,
              cardColor: const Color.fromARGB(255, 54, 54, 54),
              url: store.films[index].url,
              onFavorited: addorremoveDatabase,
            ),
          ),
        );
      }
    });
  }
}
