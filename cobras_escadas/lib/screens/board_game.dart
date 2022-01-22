import 'package:cobras_escadas/components/controle_widget.dart';
import 'package:cobras_escadas/components/tabuleiro_widget.dart';
import 'package:flutter/material.dart';

class BoardGamePage extends StatelessWidget {
  const BoardGamePage({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text('Cobras e Escadas') ,),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            TabuleiroWidget(
              size: size,
            ),
            ControleWidget(
              size: size,
            )
          ],
        ),
      ),
    );
  }
}
