
import 'dado.dart';

class Jogador {
  int _localizacao = 0;

  int get localizacao => _localizacao;


  int dado1 = 0;
  int dado2 = 0;

  reiniciar(){
    _localizacao = 0;
    dado1 = 0;
    dado2 = 0;
  }

  moveJogadorFrente(int resultadoDosDados) {
    if (_localizacao + resultadoDosDados > 100) {
      int resultado = _localizacao + resultadoDosDados;
      int diferenca = resultado - 100;
      _localizacao = 100 - diferenca;
    } else {
      _localizacao += resultadoDosDados;
    }
  }

  moveJogadorTras(int numero){
    if (_localizacao == 100) {
      _localizacao += 0;
    } else if (_localizacao == 5){
      _localizacao -= 4;

    } else if (_localizacao == 4){
      _localizacao -= 3;
    }
     else if (_localizacao == 3){
      _localizacao -= 2;

    } else if (_localizacao == 2){
      _localizacao -= 1;
    }else if (_localizacao == 1){
      _localizacao -= 0;
    }
     else {
       _localizacao -= numero;
    }
  }

  rolarDados() {
    Dado d = Dado();
    d.rolarDado();
    dado1 = d.numero;
    d.rolarDado();
    dado2 = d.numero;
  }
}
