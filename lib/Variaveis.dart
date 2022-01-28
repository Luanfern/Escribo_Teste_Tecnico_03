import 'package:flutter/material.dart';
import 'package:starwars_escribo/Network/Models/Filmes/FilmesModel.dart';
import 'package:starwars_escribo/Views/Body.dart';
import 'package:starwars_escribo/componentes/Lists/FilmesList.dart';

import 'Network/Models/Favoritos/Favoritos.dart';
import 'Network/Models/Personagens/PersonagensModel.dart';

Widget page = const ListFilmes();

Widget tela = const Expanded(
  child: CorpoApp(),
);

bool siteoficialaberto = false;

bool editaravataraberto = false;

Color corfundoavatar = Colors.white;

//Pagina Personagem
List<Personagem> personagens = [];
int persopage = 1;
int maxinfoperso = 0;

//Pagina Filmes
List<Filme> filmes = [];
int filmepage = 1;
int maxinfofilmes = 0;

//Pagina Favoritos
List<Favorito> favoritos = [];