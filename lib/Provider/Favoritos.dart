import 'package:flutter/material.dart';
import 'package:starwars_escribo/Database/Database_Favoritos.dart';
import '../Network/Models/Favoritos/Favoritos.dart';
import '../Variaveis.dart';

class GerenciamentodeFavoritos with ChangeNotifier {

  final BancoFavoritos = DatabaseFavoritos.instance;

  List<Favorito> get getListfavoritos{
    final res = Favoritosget();
    List<Favorito> attlist = [];
    res.forEach((row) => {
      print(row),
      attlist.add(
        row
      ),
    });
    return favoritos;
  }

  void setaddListfavoritos(Favorito value){
    favoritos.add(value);
    inserir(value);
    notifyListeners();
  }

  void setremoveListfavoritos(Favorito value){
    favoritos.remove(value);
    deletar(value);
    notifyListeners();
  }

  //Funcoes - Banco de Dados

  void inserir(Favorito dados) async {
     Map<String, dynamic> row = {
      DatabaseFavoritos.columnName : dados.name,
      DatabaseFavoritos.columnType  : dados.type
    };
    await BancoFavoritos.inserirFavorito(row);
  }

  void deletar(Favorito dados) async {
    await BancoFavoritos.deletarFavorito(dados.name!);
  }

  Favoritosget() async {
    final gt = await BancoFavoritos.getFavoritos();
    return gt;
  }

}