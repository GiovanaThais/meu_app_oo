import 'dart:math';
import 'dart:io';
import 'package:meu_app_oo/classes/pessoa_model.dart';

class ImcService {
  late final PessoaModel pessoa;

  inicializaDados() {
    try {
      print("Digite o peso: ");
      String inputWeight = stdin.readLineSync() ?? '0';
      final peso = int.parse(inputWeight);

      print('Digite sua altura: ');
      String inputHeight = stdin.readLineSync() ?? '0';
      final altura = double.parse(inputHeight);

      pessoa = PessoaModel(altura: altura, peso: peso);
    } catch (e) {
      print("Erro ao ler os dados: $e");
    }
  }

  calculaImc() {
    //programa calcula IMC

    double imc = _calcImcExpr(pessoa);

    //print(imc);

    _imprimirResult(imc);
  }

  double _calcImcExpr(PessoaModel pessoa) {
    if (pessoa.altura <= 0) {
      throw Exception("Altura inválida");
    }
    return pessoa.peso / pow(pessoa.altura, 2);
  }

  _imprimirResult(double imc) {
    if (imc < 16) {
      print("Magreza grave");
    } else if (imc > 16 && imc < 17) {
      print("magreza moderada");
    } else if (imc > 17 && imc < 18.5) {
      print("Magreza leve");
    } else if (imc >= 18.6 && imc < 24.9) {
      print('Peso Ideal');
    } else if (imc >= 24.9 && imc < 29.9) {
      print('Sobrepeso');
    } else if (imc >= 29.9 && imc < 34.9) {
      print('Obesidade Grau I');
    } else if (imc >= 34.9 && imc < 39.9) {
      print('Obesidade Grau II');
    } else if (imc >= 40) {
      print('Obesidade Grau III');
    }
  }
}
