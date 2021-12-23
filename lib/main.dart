import 'package:flutter/material.dart';
import 'package:flutterfoldingcellsample/my_folding_cell_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFoldingCellScreen(),
    );
  }
}
