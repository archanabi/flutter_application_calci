
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorModel with ChangeNotifier {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;
   void pressButton(String buttonText) {
    if (buttonText == 'C' || buttonText == '⌫') {
      _expression = '';
      _result = '';
    } else if (buttonText == '=') {
      _result = _calculateExpression();
    } else if (buttonText == '×') {
      _expression += '*';
    } else if (buttonText == '÷') {
      _expression += '/';
    } else {
      _expression += buttonText;
    }
    notifyListeners();
  }

  // void pressButton(String buttonText) {
  //   if (buttonText == 'C') {
  //     _expression = '';
  //     _result = '';
  //   } else if (buttonText == '=') {
  //     _result = _calculateExpression();
  //   } else {
  //     _expression += buttonText;
  //   }
  //   notifyListeners();
  // }

  String _calculateExpression() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_expression);
      ContextModel cm = ContextModel();
      return expression.evaluate(EvaluationType.REAL, cm).toString();
    } catch (e) {
      return 'invalid';
    }
  }
}