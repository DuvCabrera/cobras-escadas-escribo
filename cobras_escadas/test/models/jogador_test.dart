import 'package:cobras_escadas/models/jogador.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Jogador', () {
    test('Rolando dados', () {
      Jogador jogador = Jogador();
      jogador.rolarDados();
      expect(jogador.dado1 != 0, isTrue);
      expect(jogador.dado2 != 0, isTrue);

    });

    test('Jogador esta Movendo?', () {
      Jogador jogador = Jogador();
      jogador.moveJogadorFrente(10);
      expect(jogador.localizacao, 10);
    });

    test('Jogador esta voltando depois do 100?', () {
      Jogador jogador = Jogador();
      jogador.moveJogadorFrente(120);
      expect(jogador.localizacao, 80);
    });


  });
}