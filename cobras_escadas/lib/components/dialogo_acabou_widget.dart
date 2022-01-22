import 'package:flutter/material.dart';

class DialogoAcabouWidget extends StatefulWidget {

  final String texto;
  const DialogoAcabouWidget({Key? key, required this.texto,})
      : super(key: key);


  @override
  State<DialogoAcabouWidget> createState() => _DialogoAcabouWidgetState();
}

class _DialogoAcabouWidgetState extends State<DialogoAcabouWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('O jogo acabou'),
      content: Text(
        widget.texto,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
