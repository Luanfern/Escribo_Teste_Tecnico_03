import 'package:character_module/src/domain/usecases/fetch_character_from_database.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../domain/usecases/remove_favorite_character.dart';

part 'character.store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store{
  late final IFetchCharacterFromPage fetchCharactersFromPage;
  late final IFavoriteCharacter favoriteCharacter;
  late final IFetchCharactersFromDatabase fetchCharactersFromDatabase;
  late final IRemoveFavoriteCharacter removeFavoriteCharacter;

  _CharacterStore({
    required this.fetchCharactersFromPage,
    required this.favoriteCharacter,   
    required this.fetchCharactersFromDatabase,
    required this.removeFavoriteCharacter
  });

  @observable
  List<Character> character = [];

  @observable
  int page = 2;

  @observable
  bool isLoading = true;

  @observable
  ScrollController controller = ScrollController();

  @observable
  List<Character> favoriteCharacters = [];

  @action
  Future<void> removeFavoriteChar(String name, String url, bool isAdd) async {
    isLoading = true;
    String namefr = '';

    character.forEach((element) async {
      if (element.name == name) {
        namefr = element.name;
      }
    });

    await removeFavoriteCharacter(name);
    int indexAlterate = character.indexWhere((elementtwo) => elementtwo.name == namefr);
    character.removeAt(indexAlterate);
    character.insert(indexAlterate,Character(name: name, url: url, isFavorite: false));
    isLoading = false;
  }

  @action
  Future<void> saveFavoriteChar(String name, String url, bool isAdd) async {
    isLoading = true;
    String namefr = '';

    character.forEach((element) async {
      if (element.name == name) {
        namefr = element.name;
      }
    });

    await favoriteCharacter(Character(name: name, url: url));
    int indexAlterate = character.indexWhere((elementtwo) => elementtwo.name == namefr);
    character.removeAt(indexAlterate);
    character.insert(indexAlterate,Character(name: name, url: url, isFavorite: true));
    isLoading = false;
  }


  @action
  controllerScroll(){
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        fetchMoreCharacters();
      }
    });
  }
  
  @action
  Future<void> fetchMoreCharacters() async {
    page++;
    await fetchCharacters(page);
  }


  @action
  Future<void> fetchCharacters(page) async {

    isLoading = true;
    List<Character> provisionalcharacters = [];

      final fetchfavoriteCharactersreturn = await fetchCharactersFromDatabase();
      favoriteCharacters.addAll(fetchfavoriteCharactersreturn);

      if (page == 2) {
        for (var i = 0; i < 2; i++) {
          final fetchcharactersreturn = await fetchCharactersFromPage(i+1);
          provisionalcharacters.addAll(fetchcharactersreturn);
        }
      }else{
        final fetchcharactersreturn = await fetchCharactersFromPage(page);
        provisionalcharacters.addAll(fetchcharactersreturn);
      }

      provisionalcharacters.forEach((element) {
      bool istrue = false;
      final namef = element.name;
      if (favoriteCharacters.isNotEmpty) {
        favoriteCharacters.forEach((elementtwo) {
          final favoritef = elementtwo.name;
          if (namef == favoritef) {
           istrue = true;
          }
        });
      }
      character.add(Character(name: element.name, url: element.url, isFavorite: istrue));
    });



    isLoading = false;
  }
}