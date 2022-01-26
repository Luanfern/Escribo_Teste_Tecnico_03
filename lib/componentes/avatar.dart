import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({ Key? key }) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.17,
      width: MediaQuery.of(context).size.width * 0.17,
      color: Colors.red,
    );
  }
}