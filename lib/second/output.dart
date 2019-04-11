import 'calc.dart';

class Output {
  Output(MentalCalc calc) {
    calc.onAdd.listen((value) {
      print(value);
    });
  }
}
