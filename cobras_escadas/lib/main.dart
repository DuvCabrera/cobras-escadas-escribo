import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:cobras_escadas/screens/board_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CobraEscada());
}

class CobraEscada extends StatelessWidget {
  const CobraEscada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CobrasEscadas(),
      child: MaterialApp(home: BoardGamePage()),
    );
  }
}
