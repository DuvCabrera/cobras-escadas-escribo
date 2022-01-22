import 'package:cobras_escadas/models/cobras_escadas.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('cobras e escadas', () {

    test('Criação de campos funcionando', () {
      CobrasEscadas cobras = CobrasEscadas();
      expect(cobras.campos.length, 100);
    });

    test('Criação de cobras funcionando', () {
      CobrasEscadas cobras = CobrasEscadas();
      expect(cobras.campos.where((e) => e.cobra == true).length, 10);
    });

    test('Criação de escadas funcionando', () {
      CobrasEscadas cobras = CobrasEscadas();
      expect(cobras.campos.where((e) => e.escada == true).length, 10);
    });

    test('Vez do jogador muda', () {
      CobrasEscadas cobras = CobrasEscadas();
      cobras.jogadaDoJogador();
      expect(cobras.vezJogador1, false);
    });

    test('Vez do jogador muda', () {
      CobrasEscadas cobras = CobrasEscadas();
      cobras.jogadaDoJogador();
      expect(cobras.jogador1.dado1 != 0, isTrue);
    });

  });
}