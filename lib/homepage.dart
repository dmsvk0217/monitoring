import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avengers"),
      ),
      body: ListView(
        children: [
          Center(
            child: Text("mornitoring"),
          ),
        ],
      ),
    );
  }
}
