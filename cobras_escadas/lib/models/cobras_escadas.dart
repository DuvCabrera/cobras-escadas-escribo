
import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'campo.dart';
import 'jogador.dart';

class CobrasEscadas extends ChangeNotifier {

  final Jogador jogador1 = Jogador();
  final Jogador jogador2 = Jogador();
  final int qtdCampos = 100;
  List<Campo> _campos = [];

  List<Campo> get campos => _campos;

  CobrasEscadas(){
    _criarCampos();
    _sortearEscadas();
    _sortearCobras();
  }

  int ultimaPosicaoJogador1 = 0;
  int ultimaPosicaoJogador2 = 0;
  int jogadorD1 = 0;
  int jogadorD2 = 0;

  bool temCobra = false;
  bool temEscada = false;

  void dadosJogador(int dado1, int dado2){
    jogadorD1 = dado1;
    jogadorD2 = dado2;
  }

  bool _jogoAcabou = false;
  bool _vezJogador1 = true;

  bool get vezJogador1 => _vezJogador1;

  bool get jogoAcabou => _jogoAcabou;

  void jogadaDoJogador(){
    Jogador jogador = _validaJogador();
    jogador.rolarDados();
    _validaDado(jogador);
    notifyListeners();
  }

  int jogar(int dado1, int dado2) {
    int result = dado2+ dado1;
    return result;
  }

  void ocupaCampo(Jogador jogador){
    if (_campos[jogador.localizacao -1].escada){
      temEscada = true;
      jogador.moveJogadorFrente(6);

    } else if (_campos[jogador.localizacao -1].cobra){
      temCobra = true;
      jogador.moveJogadorTras(6);
    }

    if(_vezJogador1){
      ultimaPosicaoJogador1 = jogador.localizacao - 1;
      _campos[jogador.localizacao - 1].ocuparP1();

    }else if(!_vezJogador1) {
      ultimaPosicaoJogador2 = jogador.localizacao - 1;
      _campos[jogador.localizacao - 1].ocuparP2();

    }
  }

  void trocarVez(){
    if(_vezJogador1){
      _vezJogador1 = false;
    }else {
      _vezJogador1 = true;
    }
  }

  void reiniciar() {
    _campos.forEach((element) {element.reiniciar();});
    _campos = [];
    _criarCampos();
    _sortearCobras();
    _sortearEscadas();
    jogador1.reiniciar();
    jogador2.reiniciar();
    jogadorD1 = 0;
    jogadorD2 = 0;
    _jogoAcabou = false;
    notifyListeners();
  }

  void _criarCampos() {
    for (int c = 0; c < qtdCampos; c++) {
     var campo = Campo();
      campo.novaPosicao(c+1);
      _campos.add(campo);
    }
  }

  void _sortearEscadas() {
    int sorteadas = 0;

    while(sorteadas < 8){
      int i = Random().nextInt(_campos.length - 10);

      if (!_campos[i].escada){
        sorteadas ++;
        _campos[i].temEscada();
      }
    }
  }

  void _sortearCobras() {
    int sorteadas = 0;

    while(sorteadas < 8){
      int i = Random().nextInt(_campos.length - 6);

      if (!_campos[i].cobra){
        sorteadas ++;
        _campos[i].temCobra();
      }
    }
  }

  void _validaDado(Jogador jogador) {
    if (jogador.dado1 == jogador.dado2){
      dadosJogador(jogador.dado1, jogador.dado1);
      jogador.moveJogadorFrente(jogar(jogador.dado1,jogador.dado2));
      ocupaCampo(jogador);

    } else {
      dadosJogador(jogador.dado1, jogador.dado2);
      jogador.moveJogadorFrente(jogar(jogador.dado1,jogador.dado2));
      if(jogador.localizacao == 100){
        ocupaCampo(jogador);
        _jogoAcabou = true;
      }else {
        ocupaCampo(jogador);
        trocarVez();
      }
    }
  }

  Jogador _validaJogador() {
    Jogador jogador;
    if(vezJogador1){
      jogador = jogador1;
    } else {
      jogador = jogador2;
    }
    return jogador;
  }

}