import 'package:meu_app_oo/classes/pessoa_model.dart';
import 'package:meu_app_oo/classes/utils/imc_service.dart';
import 'package:test/test.dart';

void main() {
  group('IMC Service Test', () {
    test('Calculo de IMC deve estar correto', () {
      final imcService = ImcService();
      imcService.pessoa = PessoaModel(peso: 70, altura: 1.75);

      final imcCalculado = imcService.calculaImc();
      expect(imcCalculado, closeTo(22.86, 0.01));
    });

    test('IMC abaixo de 16 deve ser classificado como "Magreza grave"', () {
      final imcService = ImcService();
      imcService.pessoa = PessoaModel(peso: 45, altura: 1.75);

      final classificacao = imcService.calculaImc();
      expect(classificacao, "Magreza grave");
    });

    test('IMC entre 18.6 e 24.9 deve ser classificado como "Peso Ideal"', () {
      final imcService = ImcService();
      imcService.pessoa = PessoaModel(peso: 68, altura: 1.75);

      final classificacao = imcService.calculaImc();
      expect(classificacao, "Peso Ideal");
    });

    // Adicione mais testes de classificação conforme necessário
  });
}
