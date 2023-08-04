import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avengers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TemperatureHumidityChart(),
    );
  }
}
