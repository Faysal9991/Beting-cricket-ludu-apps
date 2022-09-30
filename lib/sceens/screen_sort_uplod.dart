import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSortUplod extends StatelessWidget {
  const ScreenSortUplod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uplod screen Sort"),
      ),
      body: Center(child: ElevatedButton(onPressed: (){}, child: Text("press here to uplod photo"))),
    );
  }
}