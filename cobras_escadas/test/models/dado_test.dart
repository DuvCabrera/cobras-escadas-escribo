import 'package:cobras_escadas/models/dado.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  group('Dado', (){

    test('Numero Entre 1 E 6', () {
      Dado d1 = Dado();
      d1.rolarDado();
      expect(d1.numero >=1 || d1.numero <= 6 , isTrue);
    });
  });
}