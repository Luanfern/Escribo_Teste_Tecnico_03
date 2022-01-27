import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starwars_escribo/Network/Models/Filmes/FilmesPageModel.dart';

String baseURL = 'https://swapi.dev/api/films/?';
String formatReq = 'format=json';

Future<FilmesPage> fetchFilmes(String page) async {
  print('req feita!!!');
  String pesqUrl = page == ''
  ? baseURL+formatReq
  : baseURL+'page='+page+'&'+formatReq;
  final response = await http.get(Uri.parse(pesqUrl));

  print('-------URL---------');
  print(pesqUrl);

  if (response.statusCode == 200) {
    return FilmesPage.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}