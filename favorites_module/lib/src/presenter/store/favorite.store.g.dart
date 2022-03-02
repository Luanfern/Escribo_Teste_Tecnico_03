// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  final _$favoritesAtom = Atom(name: '_FavoriteStore.favorites');

  @override
  List<Favorite> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Favorite> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FavoriteStore.isLoading');

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

  final _$removeFavoriteAsyncAction =
      AsyncAction('_FavoriteStore.removeFavorite');

  @override
  Future<void> removeFavorite(String name) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(name));
  }

  final _$fetchFavoritesAsyncAction =
      AsyncAction('_FavoriteStore.fetchFavorites');

  @override
  Future<void> fetchFavorites() {
    return _$fetchFavoritesAsyncAction.run(() => super.fetchFavorites());
  }

  @override
  String toString() {
    return '''
favorites: ${favorites},
isLoading: ${isLoading}
    ''';
  }
}
