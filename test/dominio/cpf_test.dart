import 'package:flutter_application_1/dominio/cpf.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Entidade CPF', () {
    test('CPF preenchido corretamente', () {
      expect(() => CPF('471.328.528-50'), returnsNormally);
    });

    test('CPF vazio', () {
      expect(() => CPF(''), throwsException);
    });

    group('[e04] CPF – deve possuir 11 números', () {
      test('teste cpf com 11 números', () {
        expect(CPF('471.328.528-50').eOnzeNumeros(), true);
      });

      test('teste cpf com 10 números', () {
        expect(() => CPF('471.328.528-5').eOnzeNumeros(), throwsException);
      });

      test('teste cpf com 12 números', () {
        expect(() => CPF('471.328.5281-50').eOnzeNumeros(), throwsException);
      });
    });
    group('Validar CPF', () {
      test('Valida o CPF', () {
        expect(CPF('109.861.329-50').validaCPF(), false);
      });
    });
  });
}
