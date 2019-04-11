import 'dart:async';

void main() {
  final data = {'いちご': '苺', 'みかん': '蜜柑'};

  final controller = StreamController<String>();

  controller.sink.add('いちご');
  controller.sink.add('れもん');

  final toKanji =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (data.containsKey(value)) {
      sink.add(data[value]);
    } else {
      sink.addError('${value}の漢字は不明です');
    }
  });

  controller.stream.transform(toKanji).listen((value) {
    print(value);
  }, onError: (err) {
    print('[error] $err');
  });
}
