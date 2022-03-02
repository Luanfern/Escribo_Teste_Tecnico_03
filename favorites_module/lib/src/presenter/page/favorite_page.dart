import 'package:dependency_module/dependency_module.dart';
import 'package:design_system_module/design_system_module.dart';
import 'package:flutter/material.dart';
import '../store/favorite.store.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ModularState<FavoritePage, FavoriteStore> {
  @override
  void initState() {
    fetchfavorites();
    super.initState();
  }

  fetchfavorites() async {
    await store.fetchFavorites();
    print('initState()');
  }

  void removeDatabase(String name, String url, bool isAdd) async {
    await store.removeFavorite(name);
  }

  Color filmorperson(String url) {
    final String _url = url.replaceAll('https://swapi.dev/api/', '');
    final cut = _url.split('/');
    if (cut[0] == 'films') {
      return const Color.fromARGB(255, 150, 0, 0);
    } else {
      return const Color.fromARGB(255, 0, 150, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      store.favorites.forEach((element) {
        print(element.name + element.isFavorite.toString());
      });
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
        if (store.favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.red, size: 100),
                SizedBox(height: 10),
                Text(
                  'Nenhum Favorito Adicionado...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        } else {
          return ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 20),
            children: List.generate(
              store.favorites.length,
              (index) => DefaultCard(
                name: store.favorites[index].name,
                isFavorite: store.favorites[index].isFavorite,
                cardColor: filmorperson(store.favorites[index].url),
                url: store.favorites[index].url,
                onFavorited: removeDatabase,
              ),
            ),
          );
        }
      }
    });
  }
}
