import 'package:flutter/material.dart';

class MapLandpads extends StatelessWidget {
const MapLandpads ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.black,
    child: const Center(
      child: Icon(
        Icons.photo_rounded,
        color: Colors.white,
      ),
    ),
  );
}
}