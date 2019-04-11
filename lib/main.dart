import 'package:flutter/material.dart';
import 'screen.dart';
import 'blocs/calc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CalcBlocProvider(
        child: CalcScreen(),
      ),
    );
  }
}
