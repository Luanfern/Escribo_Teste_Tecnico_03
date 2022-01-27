import 'package:flutter/material.dart';
import 'package:starwars_escribo/Network/Models/Personagens/PersonagensModel.dart';
import '../Variaveis.dart';

class GerenciamentodePersonagens with ChangeNotifier {

  List<Personagem> get getListpersonagens{
    return personagens;
  }

  void setListpersonagens(List<Personagem> value){
    personagens = value;
    notifyListeners();
  }

  int get getPersoPage{
    return persopage;
  }

  void setPersoPage(int value){
    persopage = value;
    notifyListeners();
  }

}