import 'package:flutter/material.dart';
import '../Variaveis.dart';

class GerenciamentodeTelas with ChangeNotifier {
  
  Widget get gettela{
    return tela;
  }

  void settela(Widget value){
    tela = value;
    notifyListeners();
  }

  bool get getsiteoficial{
    return siteoficialaberto;
  }

  void setsiteoficial(bool value){
    siteoficialaberto = value;
    notifyListeners();
  }

  bool get getavatar{
    return editaravataraberto;
  }

  void setavatar(bool value){
    editaravataraberto = value;
    notifyListeners();
  }

}