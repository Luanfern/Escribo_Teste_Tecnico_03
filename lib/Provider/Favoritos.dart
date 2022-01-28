import 'package:flutter/material.dart';
import 'package:starwars_escribo/Database/Database_Favoritos.dart';
import '../Network/Models/Favoritos/Favoritos.dart';
import '../Variaveis.dart';

class GerenciamentodeFavoritos with ChangeNotifier {
  final BancoFavoritos = DatabaseFavoritos.instance;

  List<Favorito> get getListfavoritos {
    return favoritos;
  }

  void setaddListfavoritos(Favorito value) {
    favoritos.add(value);
    inserir(value);
    notifyListeners();
  }

  void setremoveListfavoritos(Favorito value) {
    final rt = favoritos.removeWhere((element) => element.name == value.name);
   deletar(value);
    notifyListeners();
  }

  //Funcoes - Banco de Dados

  void inserir(Favorito dados) async {
    Map<String, dynamic> row = {
      DatabaseFavoritos.columnName: dados.name,
      DatabaseFavoritos.columnType: dados.type
    };
    await BancoFavoritos.inserirFavorito(row);
  }

  void deletar(Favorito dados) async {
    await BancoFavoritos.deletarFavorito(dados.name!);
  }

  Favoritosgetbd() async {
    final gt = await BancoFavoritos.getFavoritos();
    favoritos.clear();
    gt.forEach((element) {
      favoritos.add(
        Favorito(
          id: element[DatabaseFavoritos.columnId],
          name: element[DatabaseFavoritos.columnName],
          type: element[DatabaseFavoritos.columnType],
        ),
      );
    });
  }
}
