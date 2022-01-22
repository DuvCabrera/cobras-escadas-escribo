import 'package:cobras_escadas/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  const CampoWidget({Key? key, required this.campo}) : super(key: key);
  final Campo campo;

  _pegaCor() {
    if (campo.ocupadoP1 && campo.ocupadoP2){
      return Colors.purple;
    }
    else if (campo.ocupadoP1) {
      return Colors.red;
    }
    else if (campo.ocupadoP2) {
      return Colors.blue;
    }

    else if(campo.numeroPosicao % 9 == 0){
      return Colors.amberAccent;
    }
    else if(campo.numeroPosicao %7 == 0){
      return Colors.grey;
    }
    else if(campo.numeroPosicao %5 == 0){
      return Colors.white;
    }
    else if(campo.numeroPosicao %2 == 0){
      return Colors.green;
    } else {
      return Colors.brown;
    }

  }

  _cobraEscada() {
    if (campo.cobra){
      return Image.asset('images/cobra.jpg', height: 20, width: 20,);
    }
    else if (campo.escada){
      return Image.asset('images/escada.png', height: 20, width: 20,);
    }
    else if (campo.ocupadoP1 || campo.ocupadoP2){
      return Image.asset('images/peao.jpg', height: 20, width: 20,);
    }else{
      return Text('');
    }


  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: _pegaCor(),
              border: const Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            campo.numeroPosicao.toString(),
            style: const TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
        Positioned(top: 15 , left: 10,child: _cobraEscada()),
      ],
    );
  }
}
