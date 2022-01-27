import 'package:flutter/material.dart';
import 'package:starwars_escribo/Network/Models/Filmes/FilmesModel.dart';
import '../Variaveis.dart';

class GerenciamentodeFilmes with ChangeNotifier {

  List<Filme> get getListfilmes{
    return filmes;
  }

  void setListfilmes(List<Filme> value){
    filmes = value;
    notifyListeners();
  }

  int get getFilmePage{
    return filmepage;
  }

  void setFilmePage(int value){
    filmepage = value;
    notifyListeners();
  }

  int get getmaxinfofilmes{
    return maxinfofilmes;
  }

  void setmaxinfofilmes(int value){
    maxinfofilmes = value;
    notifyListeners();
  }

}