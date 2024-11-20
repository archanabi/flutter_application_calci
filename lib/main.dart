import 'package:flutter/material.dart';
import 'package:flutter_application_calci/bottomnavbar.dart';

import 'package:flutter_application_calci/providercalci/model.dart';
import 'package:flutter_application_calci/providercalci/view.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: MaterialApp(
        title: 'Flutter Calculator',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BottomNavBarExample(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}





