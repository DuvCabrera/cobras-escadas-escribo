import 'package:flutter/material.dart';

class DialogoFimWidget extends StatefulWidget {
  final Function onConfirmar;


  const DialogoFimWidget({
    Key? key,

    required this.onConfirmar,
  }) : super(key: key);

  @override
  State<DialogoFimWidget> createState() => _DialogoFimWidgetState();
}

class _DialogoFimWidgetState extends State<DialogoFimWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Fim'),
      content: Text('O jogo acabou!'),
      actions: [
        ElevatedButton(
            onPressed: () {
              widget.onConfirmar();
              Navigator.pop(context);
            },
            child: const Text('Jogar Novamente'))
      ],
    );
  }
}
