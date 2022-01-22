import 'package:flutter/material.dart';

class DialogoVitoriaWidget extends StatefulWidget {
  final Function onConfirmar;
  final String jogador;

  const DialogoVitoriaWidget({
    Key? key,
    required this.jogador,
    required this.onConfirmar,
  }) : super(key: key);

  @override
  State<DialogoVitoriaWidget> createState() => _DialogoVitoriaWidgetState();
}

class _DialogoVitoriaWidgetState extends State<DialogoVitoriaWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Você Venceu'),
      content: Text('Jogador Nº ${widget.jogador} Venceu!'),
      actions: [
        ElevatedButton(
          onPressed: () { Navigator.pop(context);
          },
          child: const Text('Retornar ao Jogo'),
        ),
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
