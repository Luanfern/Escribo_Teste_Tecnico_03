import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFe0f2f1),
      ),
    );
  }
}
