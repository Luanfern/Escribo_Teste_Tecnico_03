// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvatarStore on _AvatarStore, Store {
  final _$updateAvatarAsyncAction = AsyncAction('_AvatarStore.updateAvatar');

  @override
  Future<void> updateAvatar(String avatar) {
    return _$updateAvatarAsyncAction.run(() => super.updateAvatar(avatar));
  }

  final _$verifyExistAsyncAction = AsyncAction('_AvatarStore.verifyExist');

  @override
  Future<void> verifyExist(int id, String avatar) {
    return _$verifyExistAsyncAction.run(() => super.verifyExist(id, avatar));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
