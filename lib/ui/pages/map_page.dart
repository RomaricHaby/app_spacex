


import 'package:flutter/cupertino.dart';

import '../components/map_landpads.dart';

class MapPage extends StatefulWidget{
  final bool isFromFavorite;

  const MapPage({Key? key, this.isFromFavorite = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return MapLandpads();
  }
}