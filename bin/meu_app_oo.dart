import 'package:meu_app_oo/classes/utils/imc_service.dart';

void main() {
  final imcService = ImcService();

  imcService.inicializaDados();

  imcService.calculaImc();
}
