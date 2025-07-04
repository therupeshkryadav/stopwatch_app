import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/stopwatch_controller.dart';
import '../widgets/control_buttons.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

String formatTime(int milliseconds) {
  final minutes = (milliseconds ~/ 60000).toString().padLeft(2, '0');
  final seconds = ((milliseconds % 60000) ~/ 1000).toString().padLeft(2, '0');
  final ms = ((milliseconds % 1000) ~/ 10).toString().padLeft(2, '0'); // two digits
  return "$minutes:$seconds:$ms";
}

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StopwatchController>();

    return Scaffold(
      appBar: AppBar(title: Text('MVC Stopwatch'),backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(formatTime(controller.milliseconds),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
            SizedBox(height: 40),
            ControlButtons()
          ],
        ),
      ),
    );
  }
}
