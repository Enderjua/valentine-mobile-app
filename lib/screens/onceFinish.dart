import 'package:app/screens/finishPage.dart';
import 'package:app/screens/randomDate.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:animated_background/animated_background.dart';

class OnceFinish extends StatefulWidget {
  const OnceFinish({Key? key}) : super(key: key);
  _OnceFinishState createState() => _OnceFinishState();
}

class _OnceFinishState extends State<OnceFinish>
    with SingleTickerProviderStateMixin {
  List<String> images = [
    "assets/img/twoAsk-blur.jpeg",
    "assets/img/besAsk-blur.jpeg",
    "assets/img/threeAsk-blur.jpeg",
    "assets/img/sonAsk-blur.jpeg",
  ];

  List<String> quotes = [
    "Yazdığında doğar güneşim",
    "Gittiğinde söner güneşim",
    "Kalbimde atar gülüşün",
    "Ellerimde biter süzülüşün",
    "Ah bi' de bakınca bana",
    "Durar kalbimdeki atışlar",
    "Ellerim dokununca sana",
  ];

  void initState() {
    super.initState();
    _getRandomImages();
    _getRandomQuote();
  }

  String image = "";
  String desc =
      "Hayatımda iyi ki varsın, iyi ki yer aldın. Seni çok ama çok seviyorum, bunların milyon katına layıksın. Açıkçası elimden daha iyiside gelirdi ama şimdilik bu yeterli. Daha iyileri, daha sonraya.";
  String quote = "";

  void _getRandomImages() {
    setState(() {
      image = images[Random().nextInt(images.length)];
    });
  }

  void _getRandomQuote() {
    setState(() {
      quote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                spawnMinRadius: 9,
                spawnMaxRadius: 15,
                baseColor: Colors.red.withOpacity(0.1),
                spawnMinSpeed: 20,
                spawnMaxSpeed: 90,
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
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
            child: Center(
              child: Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  quote,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Garamond',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: RaisedButton(
                        child: Text("Özel gün çevir"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RandomDate(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: RaisedButton(
                        child: Text("Devam Et"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FinishPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
