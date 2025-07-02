import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/controllers/stopwatch_controller.dart';

void main() {
  group('StopwatchController Tests', () {
    late StopwatchController controller;

    setUp(() {
      controller = StopwatchController();
    });

    test('Initial values are correct', () {
      expect(controller.seconds, 0);
      expect(controller.isRunning, false);
    });

    test('Start method sets isRunning to true', () {
      controller.start();
      expect(controller.isRunning, true);
    });

    test('Stop method sets isRunning to false', () {
      controller.start();
      controller.stop();
      expect(controller.isRunning, false);
    });

    test('Reset method sets seconds to 0 and stops timer', () async {
      controller.start();
      await Future.delayed(Duration(seconds: 2));
      controller.reset();

      expect(controller.seconds, 0);
      expect(controller.isRunning, false);
    });

    test('Seconds increment over time after start', () async {
      controller.start();
      await Future.delayed(Duration(seconds: 3));
      controller.stop();
      expect(controller.seconds >= 2, true); // Buffer for delay
    });
  });
}
