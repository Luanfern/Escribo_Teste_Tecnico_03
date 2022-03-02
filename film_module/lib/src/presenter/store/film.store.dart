import 'package:dependency_module/dependency_module.dart';

import '../../../film_module.dart';

part 'film.store.g.dart';

class FilmStore = _FilmStore with _$FilmStore;

abstract class _FilmStore with Store {
  late final IFetchFilmsFromPage fetchFilmsFromPage;
  late final IFavoriteFilm favoriteFilm;
  late final IFetchFilmsFromDatabase fetchFilmsFromDatabase;
  late final IRemoveFavoriteFilm removefavoriteFilm;

  _FilmStore({
    required this.fetchFilmsFromPage,
    required this.favoriteFilm,
    required this.fetchFilmsFromDatabase,
    required this.removefavoriteFilm,
  });

  @observable
  List<Film> films = [];

  @observable
  List<Film> favoriteFilms = [];

  @observable
  bool isLoading = true;

  @action
  Future<void> removeFavoriteFIlm(String name, String url, bool isAdd) async {
    isLoading = true;
    String namefr = '';

    films.forEach((element) async {
      if (element.name == name) {
        namefr = element.name;
      }
    });

    await removefavoriteFilm(name);
    int indexAlterate = films.indexWhere((elementtwo) => elementtwo.name == namefr);
    films.removeAt(indexAlterate);
    films.insert(indexAlterate,Film(name: name, url: url, isFavorite: false));
    isLoading = false;
  }

  @action
  Future<void> saveFavoriteFIlm(String name, String url, bool isAdd) async {
    isLoading = true;
    String namefr = '';

    films.forEach((element) async {
      if (element.name == name) {
        namefr = element.name;
      }
    });

    await favoriteFilm(Film(name: name, url: url));
    int indexAlterate = films.indexWhere((elementtwo) => elementtwo.name == namefr);
    films.removeAt(indexAlterate);
    films.insert(indexAlterate,Film(name: name, url: url, isFavorite: true));
    isLoading = false;
  }

  @action
  Future<void> fetchFilms() async {
    isLoading = true;
    List<Film> provisionalfilms = [];

    final fetchfavoritefilmsreturn = await fetchFilmsFromDatabase();
    favoriteFilms.addAll(fetchfavoritefilmsreturn);

    final fetchfilmsreturn = await fetchFilmsFromPage(1);
    provisionalfilms.addAll(fetchfilmsreturn);    

    provisionalfilms.forEach((element) {
      bool istrue = false;
      final namef = element.name;
      if (favoriteFilms.isNotEmpty) {
        favoriteFilms.forEach((elementtwo) {
          final favoritef = elementtwo.name;
          if (namef == favoritef) {
           istrue = true;
          }
        });
      }
      films.add(Film(name: element.name, url: element.url, isFavorite: istrue));
    });


    isLoading = false;
    
  }
  void dispose() {
    films = [];
    favoriteFilms = [];
  }
}
