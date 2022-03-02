import 'package:character_module/character_module.dart';
import 'package:film_module/film_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.web,
            color: Colors.white,
          ),
        ),
        middle: Text(
          'Starwars App',
          style: theme.textTheme.headline6?.copyWith(color: Colors.white),
        ),
        trailing: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        border: const Border(),
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TabBar(
          tabs: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Films',
                style: theme.textTheme.button?.copyWith(
                  color: Colors.amberAccent,
                ),
              ),
              onPressed: null,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Persons',
                style: theme.textTheme.button?.copyWith(
                  color: Colors.amberAccent,
                ),
              ),
              onPressed: null,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                'Favorites',
                style: theme.textTheme.button?.copyWith(
                  color: Colors.amberAccent,
                ),
              ),
              onPressed: null,
            ),
          ],
          controller: tabController,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            const FilmPage(),
            const CharacterPage(),
            Container(color: Colors.redAccent),
          ],
          // tabs: [
          //   CupertinoButton(child: Text('Filmes'), onPressed: null),
          //   CupertinoButton(child: Text('Characters'), onPressed: null),
          //   CupertinoButton(child: Text('Favorites'), onPressed: null),
          // ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
