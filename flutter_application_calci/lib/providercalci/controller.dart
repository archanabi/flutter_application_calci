import 'package:flutter_application_calci/providercalci/model.dart';

class CalculatorController {
  final CalculatorModel _model;

  CalculatorController(this._model);

  void pressButton(String buttonText) {
    _model.pressButton(buttonText);
  }
}
