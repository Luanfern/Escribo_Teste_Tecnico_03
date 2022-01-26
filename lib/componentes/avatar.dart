import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/AvatarTela.dart';
import 'package:starwars_escribo/Body.dart';
import 'package:starwars_escribo/Provider/Avatar.dart';
import 'package:starwars_escribo/Provider/Telas.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodeTelas telas = Provider.of(context);
    final GerenciamentodeAvatar avatar = Provider.of(context);
    return GestureDetector(
      onTap: () {
        if (telas.getavatar == false) {
          telas.getsiteoficial == true ? telas.setsiteoficial(false): null;
          telas.settela(
            const Expanded(
              child: AvatarTela(),
            ),
          );
          telas.setavatar(true);
        } else {
          telas.settela(
            const Expanded(
              child: CorpoApp(),
            ),
          );
          telas.setavatar(false);
        }
      },
      child: FluttermojiCircleAvatar(
            backgroundColor: avatar.getcorfundoavatar,
            radius: 40,
          ),
      );
  }
}
