import 'package:flutter/material.dart';
import 'package:flutter_application_calci/ImageUploadScreen1.dart';
import 'package:flutter_application_calci/providercalci/view.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  final _currentIndexNotifier = ValueNotifier<int>(0);
  final _screens = [
    CalculatorScreen(),
  
    GalleryAccess(),
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
        selectedItemColor: Colors.deepPurple, 
        unselectedItemColor: Colors.grey, 
        currentIndex: _currentIndexNotifier.value,
        onTap: (index) {
          setState(() {
            _currentIndexNotifier.value = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_outlined,color: Colors.deepPurple,), // Optional: Customize active icon
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Upload',
            activeIcon: Icon(Icons.image, color: Colors.deepPurpleAccent),
          ),
        ],
      ),
    );
  }
}
