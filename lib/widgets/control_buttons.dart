import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/stopwatch_controller.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StopwatchController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: controller.isRunning ? controller.stop : controller.start,
          child: Text(controller.isRunning ? 'Pause' : 'Start'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: controller.reset,
          child: Text('Reset'),
        ),
      ],
    );
  }
}
