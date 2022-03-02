import 'package:flutter/material.dart';

class LoadingMoreInformations extends StatelessWidget {
  final Image image;
  const LoadingMoreInformations({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  const SizedBox(height: 10),
                  const Text(
                    'Caregando...',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
      ),
    );
  }
}