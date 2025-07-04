import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/stopwatch_controller.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StopwatchController>();

    String primaryLabel;
    VoidCallback primaryAction;

    if (!controller.hasStarted) {
      primaryLabel = 'Start';
      primaryAction = controller.start;
    } else if (controller.isRunning) {
      primaryLabel = 'Pause';
      primaryAction = controller.pause;
    } else {
      primaryLabel = 'Resume';
      primaryAction = controller.start;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: primaryAction,
          child: Text(primaryLabel),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: controller.reset,
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
