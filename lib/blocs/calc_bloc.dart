import 'dart:async';
import 'dart:math' show Random;

class CalcBloc {
  final _startController = StreamController<void>();
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _btnController = StreamController<bool>();

  Sink<void> get sink => _startController.sink;
  Stream<String> get onAdd => _outputController.stream;
  Stream<bool> get onToggle => _btnController.stream;

  final _repeat = 6;
  int _sum;
  Timer _timer;

  CalcBloc() {
    // wait for pushing start button
    _startController.stream.listen((_) => _start());
    // wait for notification of seconds
    _calcController.stream.listen((count) => _calc(count));
    // direct to display the button
    _btnController.sink.add(true);
  }

  void _start() {
    _sum = 0;
    _outputController.sink.add('');
    _btnController.sink.add(false);
    // notify seconds every seconds
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _calcController.sink.add(t.tick);
    });
  }

  void _calc(int count) {
    if (count < _repeat + 1) {
      final num = Random().nextInt(99) + 1;
      _outputController.sink.add('$num');
      _sum += num;
    } else {
      _timer.cancel();
      _outputController.sink.add('the answer is $_sum');
      _btnController.sink.add(true);
    }
  }

  void dispose() {
    _startController.close();
    _calcController.close();
    _outputController.close();
    _btnController.close();
  }
}
