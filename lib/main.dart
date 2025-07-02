import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/stopwatch_controller.dart';
import 'views/stopwatch_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StopwatchController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch MVC',
      debugShowCheckedModeBanner: false,
      home: StopwatchScreen(),
    );
  }
}
