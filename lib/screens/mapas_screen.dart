import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class MapasScreens extends StatelessWidget {
  const MapasScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'geo',);
    
  }
}