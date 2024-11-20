import 'package:flutter/material.dart';
import 'package:flutter_application_calci/getxcalci/view.dart';
import 'package:flutter_application_calci/image.dart';
import 'package:flutter_application_calci/providercalci/view.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0;

  final _screens = [
    CalculatorScreen(),
    GetxCalculator(),
    ImageUploadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_currentIndex) ?? Container(), // Safe indexing
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces_outline),
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

// import 'package:flutter/material.dart';

// import 'package:flutter_application_calci/getxcalci/view.dart';
// import 'package:flutter_application_calci/providercalci/view.dart';

// class BottomNavBarExample extends StatefulWidget {
//   @override
//   _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
// }

// class _BottomNavBarExampleState extends State<BottomNavBarExample> {
//   int _selectedIndex = 0;

//    List<Widget> _item = <Widget>[
//     CalculatorScreen(),
//     GetxCalculator(),
   
   
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
      
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//  body: _item.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Provider',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Getx',
//           ),
//            BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Getx',
//           ),
         
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.deepPurple,
//         onTap: _onItemTapped,
//         backgroundColor: const Color.fromARGB(255, 240, 240, 249),
//       ),
//     );
//   }
// }
