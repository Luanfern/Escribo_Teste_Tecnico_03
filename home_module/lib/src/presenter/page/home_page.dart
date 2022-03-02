import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonSite(
            funcao: (){
              if (Modular.to.navigateHistory.last.name == '/oficialsite') {
                Modular.to.pop();
              } else if(Modular.to.navigateHistory.last.name == '/avatarcustomization'){
                Modular.to.pop();
                Navigator.pushNamed(context, '/oficialsite');
              }else {
                Navigator.pushNamed(context, '/oficialsite');
              }
            },
            title: 'Site Oficial',
            link: 'https://www.starwars.com/community',
            height: 40,
            width: 150,
          ),
          GestureDetector(
            onTap: (){
              if (Modular.to.navigateHistory.last.name == '/avatarcustomization') {
                Modular.to.pop();
              } else if(Modular.to.navigateHistory.last.name == '/oficialsite'){
                Modular.to.pop();
                Navigator.pushNamed(context, '/avatarcustomization');
              }
              else {
                Navigator.pushNamed(context, '/avatarcustomization');
              }
            },
            child: FluttermojiCircleAvatar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              radius: 35,
            ),
          ),
        ],
      ),
    );
  }
}
