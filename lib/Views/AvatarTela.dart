import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class AvatarTela extends StatefulWidget {
  const AvatarTela({Key? key}) : super(key: key);

  @override
  _AvatarTelaState createState() => _AvatarTelaState();
}

class _AvatarTelaState extends State<AvatarTela> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 20),
          child: Center(
            child: FluttermojiCircleAvatar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              radius: MediaQuery.of(context).size.width / 4.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FluttermojiCustomizer(
            outerTitleText: 'Customize seu Avatar:',
            showSaveWidget: true,
          ),
        ),
      ],
    );
  }
}
