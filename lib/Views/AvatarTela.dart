import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:provider/provider.dart';
import 'package:starwars_escribo/Provider/Avatar.dart';

class AvatarTela extends StatefulWidget {
  const AvatarTela({Key? key}) : super(key: key);

  @override
  _AvatarTelaState createState() => _AvatarTelaState();
}

class _AvatarTelaState extends State<AvatarTela> {

  /* String decodeFluttermojifromString(String encodedData) {
    var decodedData = utf8.decode(base64.decode(encodedData));
    return decodedData;
  }

  Future<String> encodeMySVGtoString() async {
    var svg = await rootBundle.loadString('assets/images/avatar.svg');
    var encodedData = base64.encode(utf8.encode(svg));
    return encodedData;
  }

  Future<Map> encodeMySVGtoMap(){
    return encodeMySVGtoString().then((value) => {
      'svg': value,
      'svg_decoded': decodeFluttermojifromString(value)
    });
  } */
  
  @override
  Widget build(BuildContext context) {
    final GerenciamentodeAvatar avatar = Provider.of(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 20),
          child: Stack(
            children: [
              Center(
                child: FluttermojiCircleAvatar(
                  backgroundColor: avatar.getcorfundoavatar,
                  radius: MediaQuery.of(context).size.width / 4.5,
                ),
              ),
              Positioned(
                left: ((MediaQuery.of(context).size.width / 2 - 25) +
                    ((MediaQuery.of(context).size.width / 4.5) / 2)),
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: avatar.getcorfundoavatar,
                              onColorChanged: avatar.setcorfundoavatar,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Got it'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.color_lens,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 136, 136, 136),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
