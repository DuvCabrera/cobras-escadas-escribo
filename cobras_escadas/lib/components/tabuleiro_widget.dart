import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'campo_widget.dart';

class TabuleiroWidget extends StatelessWidget {
  const TabuleiroWidget({Key? key, required this.size}) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    var cobrasEscadas = Provider.of<CobrasEscadas>(context);
    return Container(height: size.height * 0.565,
      child: GridView.count(
          crossAxisCount: 10,
          children: cobrasEscadas.campos
              .map((e) {
            return CampoWidget(campo: e);
          })
              .toList()
              .reversed
              .toList()
      ),
    );
  }
}
