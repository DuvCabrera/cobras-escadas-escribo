import 'dart:math';

class Dado {
  int _numero = 0;

  int get numero => _numero;

  void rolarDado(){
    _numero = Random().nextInt(6) +1;
  }
}