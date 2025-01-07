
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class CalculatorModel with ChangeNotifier {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;

  void pressButton(String buttonText) {
    if (buttonText == 'C') {
      _expression = '';
      _result = '';
    } else if (buttonText == '⌫') {
      _removeLastCharacter();
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

  // Method to remove the last character
  void _removeLastCharacter() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  String _calculateExpression() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_expression);
      ContextModel cm = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, cm);

      // Check if the result is a whole number
      if (result == result.toInt()) {
        return result.toInt().toString(); // Return as an integer if whole number
      } else {
        return result.toString(); // Return as a decimal if not a whole number
      }
    } catch (e) {
      return 'invalid';
    }
  }
}

