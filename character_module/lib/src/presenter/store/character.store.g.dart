// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterStore on _CharacterStore, Store {
  final _$characterAtom = Atom(name: '_CharacterStore.character');

  @override
  List<Character> get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(List<Character> value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  final _$pageAtom = Atom(name: '_CharacterStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CharacterStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$controllerAtom = Atom(name: '_CharacterStore.controller');

  @override
  ScrollController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(ScrollController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$favoriteCharactersAtom =
      Atom(name: '_CharacterStore.favoriteCharacters');

  @override
  List<Character> get favoriteCharacters {
    _$favoriteCharactersAtom.reportRead();
    return super.favoriteCharacters;
  }

  @override
  set favoriteCharacters(List<Character> value) {
    _$favoriteCharactersAtom.reportWrite(value, super.favoriteCharacters, () {
      super.favoriteCharacters = value;
    });
  }

  final _$removeFavoriteCharAsyncAction =
      AsyncAction('_CharacterStore.removeFavoriteChar');

  @override
  Future<void> removeFavoriteChar(String name, String url, bool isAdd) {
    return _$removeFavoriteCharAsyncAction
        .run(() => super.removeFavoriteChar(name, url, isAdd));
  }

  final _$saveFavoriteCharAsyncAction =
      AsyncAction('_CharacterStore.saveFavoriteChar');

  @override
  Future<void> saveFavoriteChar(String name, String url, bool isAdd) {
    return _$saveFavoriteCharAsyncAction
        .run(() => super.saveFavoriteChar(name, url, isAdd));
  }

  final _$fetchMoreCharactersAsyncAction =
      AsyncAction('_CharacterStore.fetchMoreCharacters');

  @override
  Future<void> fetchMoreCharacters() {
    return _$fetchMoreCharactersAsyncAction
        .run(() => super.fetchMoreCharacters());
  }

  final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterStore.fetchCharacters');

  @override
  Future<void> fetchCharacters(dynamic page) {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters(page));
  }

  final _$_CharacterStoreActionController =
      ActionController(name: '_CharacterStore');

  @override
  dynamic controllerScroll() {
    final _$actionInfo = _$_CharacterStoreActionController.startAction(
        name: '_CharacterStore.controllerScroll');
    try {
      return super.controllerScroll();
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
character: ${character},
page: ${page},
isLoading: ${isLoading},
controller: ${controller},
favoriteCharacters: ${favoriteCharacters}
    ''';
  }
}
