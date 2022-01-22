import 'package:flutter/material.dart';

class DialogoCobraEscadaWidget extends StatefulWidget {
  final String titulo;
  final String texto;
  const DialogoCobraEscadaWidget({Key? key, required this.texto, required this.titulo,})
      : super(key: key);


  @override
  State<DialogoCobraEscadaWidget> createState() => _DialogoCobraEscadaWidgetState();
}

class _DialogoCobraEscadaWidgetState extends State<DialogoCobraEscadaWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo),
      content: Text(
        widget.texto,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
