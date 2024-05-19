import 'package:flutter/material.dart';
import 'dart:io' show exit;
import 'dart:async';

import 'package:valentine_mobile_app/screens/leave.dart';

class MyPainter extends CustomPainter {
  // The color of the heart
  final Color bodyColor;

  // The color of the border of the heart
  final Color borderColor;
  // The thickness of the border
  final double borderWith;

  MyPainter(this.bodyColor, this.borderColor, this.borderWith);

  @override
  void paint(Canvas canvas, Size size) {
    // The body of the heart
    final Paint body = Paint();
    body
      ..color = bodyColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    // The border of the heart
    final Paint border = Paint();
    border
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderWith;

    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.4);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, body);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class FinishPage extends StatefulWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  int _counter = 20; // start countdown from 180 seconds

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NotFinish(),
        ),
      );
    });
    Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          print("done");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnderJua <3 OneRose'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Non-border heart
          CustomPaint(
            size: const Size(280, 260),
            painter: MyPainter(Colors.pink, Colors.transparent, 0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            "HER ŞEY İÇİN TEŞEKKÜRLER",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Garamond',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "$_counter saniye kaldi",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'Digital',
            ),
          ),
        ],
      )),
    );
  }
}
