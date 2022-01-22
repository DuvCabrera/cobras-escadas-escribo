import 'package:cobras_escadas/components/dialogo_acabou_widget.dart';
import 'package:cobras_escadas/components/dialogo_vitoria_widget.dart';
import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControleWidget extends StatelessWidget {
  ControleWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  bool acabouMesmo = false;

  @override
  Widget build(BuildContext context) {
    var campo = Provider.of<CobrasEscadas>(context);

    String jogadorVez() {
      if (campo.vezJogador1) {
        return 'Role os Dados Jogador Nº 1';
      } else {
        return 'Role os Dados Jogador Nº 2';
      }
    }

    String somaOuTermina() {
      if (campo.jogoAcabou) {
        return 'O jogo acabou!';
      } else {
        return '${campo.jogadorD1.toString()} + ${campo.jogadorD2.toString()} = ${campo.jogadorD1 + campo.jogadorD2}';
      }
    }

    String jogadorGanhou() {
      if (!campo.vezJogador1) {
        return '2';
      } else {
        return '1';
      }
    }

    String posicaoJogador() {
      if(!campo.vezJogador1){
        return 'Jogador 1 está na casa ${campo.jogador1.localizacao }';
      }
      else{
        return 'Jogador 2 está na casa ${campo.jogador2.localizacao }';
      }

    }

    return Stack(
      children: [
        Container(
          height: size.height * 0.3475,
          width: size.width,
          decoration: BoxDecoration(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 18, right: 18),
          child: Container(
            height: size.height * 0.255,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 8),
                    child: Text(
                      somaOuTermina(),
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      posicaoJogador(),
                      style: const TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    if(campo.vezJogador1){
                      campo.campos[campo.ultimaPosicaoJogador1].desocuparP1();
                    }
                    if(!campo.vezJogador1){
                      campo.campos[campo.ultimaPosicaoJogador2].desocuparP2();
                    }

                    campo.jogadaDoJogador();

                    if (campo.temCobra){
                      campo.temCobra = false;
                      showDialog(
                          context: context,
                          builder: (_) => const DialogoAcabouWidget(texto: 'Ops. Você pisou em uma Cobra, volte um pouco',),);
                    }
                    if (campo.temEscada){
                      campo.temEscada = false;
                        showDialog(
                            context: context,
                            builder: (_) => const DialogoAcabouWidget(texto: 'Opa! Encontrou uma escada, avance alguns passos',),);
                    }

                    if (campo.jogoAcabou) {
                      if (!acabouMesmo) {
                        acabouMesmo = true;
                        showDialog(
                          context: context,
                          builder: (__) => DialogoVitoriaWidget(
                            onConfirmar: () => campo.reiniciar(),
                            jogador: jogadorGanhou(),
                          ),
                        );
                      } else if (acabouMesmo) {
                        showDialog(
                          context: context,
                          builder: (_) => const DialogoAcabouWidget(texto: 'Jogo Acabou',),
                        );
                      }
                    }

                  },
                  child: Text('Role os dados')),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0, left: 18),
                    child: Text(
                      jogadorVez(),
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
