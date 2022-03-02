import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

class NavigationTopics extends StatefulWidget {
  const NavigationTopics({ Key? key }) : super(key: key);

  @override
  _NavigationTopicsState createState() => _NavigationTopicsState();
}

class _NavigationTopicsState extends State<NavigationTopics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 35,
      child: Row(
        children: [
         Expanded(
           flex: 3,
            child: GestureDetector(
              onTap: (){
                //Modular.to.navigate('/films/');
                Modular.to.pushNamed('/films/');
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Films',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: (){    
                Modular.to.navigate('/characters/')      ;      
              },
              child:Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Characters',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child:GestureDetector(
              onTap: (){
                Modular.to.navigate('/favorites/');
              },
              child:Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}