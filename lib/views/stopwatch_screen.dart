import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/stopwatch_controller.dart';
import '../widgets/control_buttons.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StopwatchController>();

    return Scaffold(
      appBar: AppBar(title: Text('MVC Stopwatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(controller.seconds),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ControlButtons()
          ],
        ),
      ),
    );
  }
}
