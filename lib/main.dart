import 'dart:async';
import 'package:app/screens/finishPage.dart';
import 'package:app/screens/goOrWent.dart';

import 'screens/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Happy Valentine's Day",
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 1),
            Center(
                child: Image(
              image: AssetImage(
                'assets/img/heartt.png',
              ),
              height: 70,
            )),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: const Text(
                  "Made for Birgül",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'OoohBaby',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
