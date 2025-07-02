import 'dart:async';
import 'package:flutter/material.dart';
import '../models/stopwatch_model.dart';

class StopwatchController extends ChangeNotifier {
  final StopwatchModel _model = StopwatchModel();
  Timer? _timer;

  int get seconds => _model.seconds;
  bool get isRunning => _model.isRunning;

  void start() {
    if (_model.isRunning) return;
    _model.isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _model.seconds++;
      notifyListeners();
    });
    notifyListeners();
  }

  void stop() {
    _model.isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _model.isRunning = false;
    _model.seconds = 0;
    _timer?.cancel();
    notifyListeners();
  }
}
