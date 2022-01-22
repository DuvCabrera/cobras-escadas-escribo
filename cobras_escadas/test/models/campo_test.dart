

import 'package:cobras_escadas/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Campo', (){
    test("Tem escada funciona", () {
      Campo campo = Campo();
      campo.temEscada();
      expect(campo.escada, isTrue);
    });


  test("Tem cobra funciona", () {
      Campo campo = Campo();
      campo.temCobra();
      expect(campo.cobra, isTrue);
    });

  test("Tem ocupar funciona", () {
      Campo campo = Campo();
      campo.ocuparP1();
      expect(campo.ocupadoP1, isTrue);
    });

  test("Tem reiniciar funciona", () {
      Campo campo = Campo();
      campo.temCobra();
      campo.temEscada();
      campo.reiniciar();
      expect(campo.cobra, isFalse);
      expect(campo.escada, isFalse);
    });
  });
}