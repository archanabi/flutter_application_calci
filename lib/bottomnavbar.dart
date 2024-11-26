import 'package:flutter/material.dart';
import 'package:flutter_application_calci/ImageUploadScreen1';
import 'package:flutter_application_calci/getxcalci/view.dart';
import 'package:flutter_application_calci/providercalci/view.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  final _currentIndexNotifier = ValueNotifier<int>(0);
  final _screens = [
    CalculatorScreen(),
    GetxCalculator(),
    ImageUploadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _currentIndexNotifier,
        builder: (context, value, child) {
          return _screens.elementAt(value) ?? Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndexNotifier.value,
        onTap: (index) {
          _currentIndexNotifier.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces_outline,),
            label: 'Getx',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Upload',
          ),
        ],
      ),
    );
  }
}