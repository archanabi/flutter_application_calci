import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = ''.obs;
  var result = ''.obs;
 void addInput(String input) {
    if (input == '×') {
      expression.value += '*';
    } else if (input == '÷') {
      expression.value += '/';
    } else {
      expression.value += input;
    }
  }
    void clear() {
    if (expression.value.isNotEmpty) {
      expression.value =
          expression.value.substring(0, expression.value.length - 1);
    }
  }
  

  void calculate() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression.value);
      ContextModel contextModel = ContextModel();
      double res = exp.evaluate(EvaluationType.REAL, contextModel);
      result.value = '${expression.value}=${res.toString()}';
      expression.value = res.toString();
    } catch (e) {
      expression.value = 'invalid';
    }
  }
}



