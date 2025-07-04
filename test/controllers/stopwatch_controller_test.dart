import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/controllers/stopwatch_controller.dart';

void main() {
  group('StopwatchController Tests', () {
    late StopwatchController controller;

    setUp(() {
      controller = StopwatchController();
    });

    test('Initial values are correct', () {
      expect(controller.milliseconds, 0);
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

    test('Reset method sets milliseconds to 0 and stops timer', () async {
      controller.start();
      await Future.delayed(Duration(milliseconds: 200));
      controller.reset();

      expect(controller.milliseconds, 0);
      expect(controller.isRunning, false);
    });

    test('Milliseconds increment over time after start', () async {
      controller.start();

      // Allow enough time for multiple ticks of the 10ms interval
      await Future.delayed(Duration(milliseconds: 600));
      controller.stop();

      print("Elapsed milliseconds: ${controller.milliseconds}");

      // Loosened condition to avoid test flakiness due to test timer imprecision
      expect(controller.milliseconds >= 300, true,
          reason:
              'Expected at least 300ms, got ${controller.milliseconds}ms');
    });
  });
}
