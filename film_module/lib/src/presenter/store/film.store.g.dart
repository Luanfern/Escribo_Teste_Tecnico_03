// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilmStore on _FilmStore, Store {
  final _$filmsAtom = Atom(name: '_FilmStore.films');

  @override
  List<Film> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(List<Film> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  final _$favoriteFilmsAtom = Atom(name: '_FilmStore.favoriteFilms');

  @override
  List<Film> get favoriteFilms {
    _$favoriteFilmsAtom.reportRead();
    return super.favoriteFilms;
  }

  @override
  set favoriteFilms(List<Film> value) {
    _$favoriteFilmsAtom.reportWrite(value, super.favoriteFilms, () {
      super.favoriteFilms = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FilmStore.isLoading');

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

  final _$removeFavoriteFIlmAsyncAction =
      AsyncAction('_FilmStore.removeFavoriteFIlm');

  @override
  Future<void> removeFavoriteFIlm(String name, String url, bool isAdd) {
    return _$removeFavoriteFIlmAsyncAction
        .run(() => super.removeFavoriteFIlm(name, url, isAdd));
  }

  final _$saveFavoriteFIlmAsyncAction =
      AsyncAction('_FilmStore.saveFavoriteFIlm');

  @override
  Future<void> saveFavoriteFIlm(String name, String url, bool isAdd) {
    return _$saveFavoriteFIlmAsyncAction
        .run(() => super.saveFavoriteFIlm(name, url, isAdd));
  }

  final _$fetchFilmsAsyncAction = AsyncAction('_FilmStore.fetchFilms');

  @override
  Future<void> fetchFilms() {
    return _$fetchFilmsAsyncAction.run(() => super.fetchFilms());
  }

  @override
  String toString() {
    return '''
films: ${films},
favoriteFilms: ${favoriteFilms},
isLoading: ${isLoading}
    ''';
  }
}
