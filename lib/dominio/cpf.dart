import 'dart:js_util';

class CPF {
  late List<int> numerosCPF;

  CPF(String cpf) {
    eVazio(cpf);
    cpf = cpf.replaceAll('.', '');
    cpf = cpf.replaceAll('-', '');

    List<String> temp = cpf.split('');
    numerosCPF = cpf.split('').map(int.parse).toList();
    eOnzeNumeros();
    eNumeroDiferente();
  }

  eVazio(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio');
  }

  bool eOnzeNumeros() {
    if (numerosCPF.length != 11) throw Exception('CPF deve possuir 11 números');
    return true;
  }

  bool eNumeroDiferente() {
    for (int i = 0; i < 9; i++) {
      if (numerosCPF[i] != numerosCPF[i + 1]) return true;
    }
    throw Exception('CPF não pode ter números iguais');
  }

  bool validaCPF() {
    var calculo = 0;
    var sum = 0;
    List<int> list = numerosCPF.sublist(0, 9);
    for (var i = 1; i < 11; i++) {
      sum += numerosCPF[i - 1] * i;
      calculo += numerosCPF[i - 1] * (i - 1);
      if (i == 9) {
        list.add((sum % 11) == 10 ? 0 : (sum % 11));
      }
      if (i == 10) {
        list.add((calculo % 11) == 10 ? 0 : (calculo % 11));
      }
    }
    print(list);
    print(numerosCPF);
    print(equal(list, numerosCPF));
    return list == numerosCPF;
  }
}
