import 'package:app/screens/onceFinish.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:animated_background/animated_background.dart';

class RandomDate extends StatefulWidget {
  const RandomDate({Key? key}) : super(key: key);
  _RandomDateState createState() => _RandomDateState();
}

class _RandomDateState extends State<RandomDate>
    with SingleTickerProviderStateMixin {
  List<String> numbers = [
    "9",
    "14",
    "20",
    "18",
    "12",
    "16",
  ];

  List<String> descs = [
    "Doğum günümü kutladığın o an <3",
    "Birlikte geçirdiğimiz ilk sevgililer günü <3",
    "Seni öptüğüm ve sarıldığım ilk gün <3",
    "Bu uygulamaya başladığım ilk gün <3",
    "Tekrar barıştığımız gün <3",
    "Ellerini tuttuğum ilk gün <3",
  ];

  String number = "";
  String months = "";
  String desc = "";
  int _counter = 10; // start countdown from 180 seconds
  @override
  void initState() {
    super.initState();
    _getRandomNumber();
    _getMonths();
    _getDescs();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnceFinish(),
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

  void _getRandomNumber() {
    setState(() {
      number = numbers[Random().nextInt(numbers.length)];
    });
  }

  void _getMonths() {
    if (number != "14") {
      setState(() {
        months = "Ocak";
      });
    } else {
      setState(() {
        months = "Şubat";
      });
    }
  }

  void _getDescs() {
    if (number == numbers[0]) {
      setState(() {
        desc = descs[0].toString();
      });
    } else if (number == numbers[1]) {
      setState(() {
        desc = descs[1].toString();
      });
    } else if (number == numbers[2]) {
      setState(() {
        desc = descs[2].toString();
      });
    } else if (number == numbers[3]) {
      setState(() {
        desc = descs[3].toString();
      });
    } else if (number == numbers[4]) {
      setState(() {
        desc = descs[4].toString();
      });
    } else if (number == numbers[5]) {
      setState(() {
        desc = descs[5].toString();
      });
    } else {
      setState(() {
        desc = "Veritabanından söz çekilemedi";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
                  spawnMinRadius: 12,
                  spawnMaxRadius: 18,
                  baseColor: Colors.red.withOpacity(0.1),
                  spawnMinSpeed: 20,
                  spawnMaxSpeed: 30,
                  particleCount: 10,
                  image: Image.asset(
                    'assets/img/heartt.png',
                    color: Colors.red.withOpacity(0.1),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                paint: Paint()
                  ..color = Colors.red.withOpacity(0.1)
                  ..style = PaintingStyle.fill,
              ),
              child: Container(),
              vsync: this,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        number,
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Poppins',
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Center(
                  child: Text(
                    months,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          desc,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        "$_counter saniye kaldi",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Digital',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
