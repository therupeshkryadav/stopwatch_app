import 'dart:async';
import 'package:flutter/material.dart';
import '../models/stopwatch_model.dart';

class StopwatchController extends ChangeNotifier {
  final StopwatchModel _model = StopwatchModel();
  Timer? _timer;

  int get milliseconds => _model.milliseconds;
  bool get isRunning => _model.isRunning;

  void start() {
    if (_model.isRunning) return;
    _model.isRunning = true;
    _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      _model.milliseconds += 10;
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
    _model.milliseconds = 0;
    _timer?.cancel();
    notifyListeners();
  }
}

