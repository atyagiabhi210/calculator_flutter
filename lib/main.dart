import 'package:calculator_flutter/views/CalculatorView.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp ({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      color: Colors.amber,
      title: "Calculator App",
      home: CalculatorView(),
    );
  }
}