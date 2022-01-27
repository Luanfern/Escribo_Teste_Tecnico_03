import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Views/Home.dart';
import 'package:starwars_escribo/Provider/Pages.dart';
import 'package:starwars_escribo/Provider/Telas.dart';

import 'Provider/Avatar.dart';
import 'Provider/Personagem.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => GerenciamentodePaginas()),
          ChangeNotifierProvider(create: (ctx) => GerenciamentodeTelas()),
          ChangeNotifierProvider(create: (ctx) => GerenciamentodeAvatar()),
          ChangeNotifierProvider(create: (ctx) => GerenciamentodePersonagens()),
        ],
      child: MaterialApp(
        theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        brightness: Brightness.dark,
      ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}