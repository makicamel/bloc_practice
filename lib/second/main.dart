import 'dart:async';
import 'calc.dart';
import 'output.dart';

void main() {
  final calc = MentalCalc(6);
  Output(calc);

  // push progressing seconds every seconds
  final timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    calc.add(t.tick);
  });

  calc.onStop.listen((_) {
    timer.cancel();
  });
}
