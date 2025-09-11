import 'dart:async';

class StreamsSoket {
  final stream = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => stream.sink.add;

  Stream<List<String>> get getResponse => stream.stream.asBroadcastStream();
}
