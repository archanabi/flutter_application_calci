import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
class GetxCalculator extends StatelessWidget {
  final CalculatorController _controller = Get.put(CalculatorController());

  // Define a map for button colors>
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

  // Set of operator buttons to apply specific text color
  final Set<String> operators = {'+', '-', '*', '/', '='};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Row(
 children: [
Text("RadicalStart",style: TextStyle(fontWeight: FontWeight.w700),),], ),
 backgroundColor: const Color.fromARGB(255, 240, 240, 249), ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
           
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('C'),
                    _buildButton('%'),
                    _buildButton('x'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('00'),
                    _buildButton('='),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                
                         color: const Color.fromARGB(255, 238, 232, 232),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)
                  )
                  ),
                      
                 child: Column(
                   children: [
                     Obx(() => Text(
                      _controller.expression.value,
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                                 )),
                                  
                             Obx(() => Text(
                  _controller.result.value,
                  style: TextStyle(fontSize: 24),
                             )
                             ),
                   ],
                 ),
               ),
             ),
            SizedBox(height: 20),
          
           
          ],
          
        ),
      ),
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'C') {
          _controller.clear();
        } else if (label == '=') {
          _controller.calculate();
        } else {
          _controller.addInput(label);
        }
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 24,
          color: _getTextColor(label), // Set text color dynamically
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColors[label] ?? Colors.grey, // Set the background color dynamically
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
        minimumSize: Size(60, 60),
      ),
    );
  }

  // Determine the text color based on the label
  Color _getTextColor(String label) {
    if (operators.contains(label)) {
      return Colors.white; // Operators text color (white)
    } else {
      return Colors.black; // Numbers and other buttons text color (black)
    }
  }
}

