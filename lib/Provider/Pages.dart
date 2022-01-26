import 'package:flutter/material.dart';
import '../Variaveis.dart';

class GerenciamentodePaginas with ChangeNotifier {
  Widget get getpage{
    return page;
  }

  void setpage(Widget value){
    page = value;
    notifyListeners();
  }

}