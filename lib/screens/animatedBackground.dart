import 'dart:js';

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class AnimatedBackgroun extends StatefulWidget {
  @override
  _AnimatedBackgrounState createState() => _AnimatedBackgrounState();
}

class _AnimatedBackgrounState extends State<AnimatedBackgroun>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(),
          vsync: this,
          child: Text("as"),
        ),
      ),
    );
  }
}
