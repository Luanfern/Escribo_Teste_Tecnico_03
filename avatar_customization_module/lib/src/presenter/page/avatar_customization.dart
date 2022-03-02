import 'dart:async';

import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/home_module.dart';

import '../../../avatar_customization_module.dart';

class AvatarCustomization extends StatefulWidget {
  const AvatarCustomization({Key? key}) : super(key: key);

  @override
  _AvatarCustomizationState createState() => _AvatarCustomizationState();
}

class _AvatarCustomizationState extends ModularState<AvatarCustomization, AvatarStore> {
  late FluttermojiFunctions fluttermojiFunctions = FluttermojiFunctions();

  @override
  void initState() {
    verify();
    super.initState();
  }

  verify() async {
    String avatar = await fluttermojiFunctions.encodeMySVGtoString();                     
    await store.verifyExist(1, avatar);
  }
  
  @override
  void dispose() {
    update();
    super.dispose();
  }

  update() async {
    String avatar = await fluttermojiFunctions.encodeMySVGtoString();                     
    await store.updateAvatar(avatar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const HomePage(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            child: Center(
              child: FluttermojiCircleAvatar(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                radius: 85,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: FluttermojiCustomizer(
                    outerTitleText: 'Customize seu Avatar:',
                    showSaveWidget: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
