import 'package:flutter/material.dart';
import '../Variaveis.dart';

class GerenciamentodeAvatar with ChangeNotifier {
  
  Color get getcorfundoavatar{
    return corfundoavatar;
  }

  void setcorfundoavatar(Color value){
    corfundoavatar = value;
    notifyListeners();
  }

}