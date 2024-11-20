
import 'package:flutter/material.dart';
import 'package:flutter_application_calci/providercalci/model.dart';
import 'package:provider/provider.dart';




class CalculatorScreen extends StatelessWidget {
  final Map<String, Color> buttonColors = {
    'C': const Color.fromARGB(255, 238, 232, 232),
    '%': const Color.fromARGB(255, 238, 232, 232),
    'x': const Color.fromARGB(255, 238, 232, 232),
    '/': Colors.orange,
    '7': const Color.fromARGB(255, 235, 229, 245),
    '8': const Color.fromARGB(255, 235, 229, 245),
    '9': const Color.fromARGB(255, 235, 229, 245),
    '*': Colors.orange,
    '4': const Color.fromARGB(255, 235, 229, 245),
    '5': const Color.fromARGB(255, 235, 229, 245),
    '6': const Color.fromARGB(255, 235, 229, 245),
    '+': Colors.orange,
    '1': const Color.fromARGB(255, 235, 229, 245),
    '2': const Color.fromARGB(255, 235, 229, 245),
    '3': const Color.fromARGB(255, 235, 229, 245),
    '-': Colors.orange,
    '.': const Color.fromARGB(255, 235, 229, 245),
    '0': const Color.fromARGB(255, 235, 229, 245),
    '00': const Color.fromARGB(255, 235, 229, 245),
    '=': const Color.fromARGB(255, 35, 13, 230),
  };
final Set<String> operators = {'+', '-', '*', '/', '='};
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorModel>(
      builder: (context, model, child) {
        return Scaffold(
    appBar: AppBar(
            title: Text("RadicalStart", style: TextStyle(fontWeight: FontWeight.w700)),
            backgroundColor: const Color.fromARGB(255, 240, 240, 249),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton('C', context),
                        _buildButton('%', context),
                        _buildButton('x', context),
                        _buildButton('/', context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton('7', context),
                        _buildButton('8', context),
                        _buildButton('9', context),
                        _buildButton('*', context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton('4', context),
                        _buildButton('5', context),
                        _buildButton('6', context),
                        _buildButton('-', context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton('1', context),
                        _buildButton('2', context),
                        _buildButton('3', context),
                        _buildButton('+', context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton('.', context),
                        _buildButton('0', context),
                        _buildButton('00', context),
                        _buildButton('=', context),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 232, 232),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Column(
                          children: [
                             Text(
                               model.result,
                            style: TextStyle(fontSize: 48),),
                              Text(
                               model.expression,
                               style: TextStyle(fontSize: 24),),
                      
                              
                          ],
                        ),
                      ),
                    ),
                     ],
                  
                ),
              ],
              
            ),
          ),
          
        );
      },
    );
  }

 Widget _buildButton(String text, BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColors[text] ?? Colors.grey,
      padding: EdgeInsets.all(20.0),
      shape: CircleBorder(),
      minimumSize: Size(60, 60),
    ),
    onPressed: () => Provider.of<CalculatorModel>(context, listen: false).pressButton(text),
    child: Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: _getTextColor(text)),
      ),
    ),
  );
}
Color _getTextColor(String label) {
  if (operators.contains(label)) {
    return Colors.white; // Operators text color (white)
  } else {
    return buttonColors[label] == Colors.orange 
        ? Colors.white 
        : Colors.black; // Numbers and other buttons text color (black)
  }
}}
