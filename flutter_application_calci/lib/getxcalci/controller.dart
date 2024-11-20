import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = ''.obs;
  var result = ''.obs;

  void addInput(String input) {
    expression.value += input;
  }

  void clear() {
    expression.value = '';
    result.value = '';
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
      expression.value = 'Error';
    }
  }
}

// import 'package:get/get.dart';
// import 'package:math_expressions/math_expressions.dart';

// class CalculatorController extends GetxController {
//   var expression = ''.obs;

//   void addInput(String input) {
//     expression.value += input;
//   }

//   void clear() {
//     expression.value = '';
//   }

//   void calculate() {
//     try {
//       Parser parser = Parser();
//       Expression exp = parser.parse(expression.value);
//       ContextModel contextModel = ContextModel();
//       double result = exp.evaluate(EvaluationType.REAL, contextModel);
//       expression.value = result.toString();
//       update(); 
//     } catch (e) {
//       expression.value = 'Error';
//     }
//   }
// }

