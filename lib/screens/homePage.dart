import 'dart:async';
import 'package:animated_background/animated_background.dart';
import 'package:valentine_mobile_app/backend/randomEmoji.dart';
import 'package:valentine_mobile_app/main.dart';
import 'package:valentine_mobile_app/screens/goOrWent.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> quotes = [
    "Sensin gökyüzümü aydınlatmayı başarabilen",
    "Güneşten daha parlak, daha sıcak kalbimi ısıtabilen",
    "Hiç gitmeyen ellerinle yüreğimi sarabilen",
    "Sensin en güzel şey olarak bu dünyama giren",
    "Tüm kötülükleri unutturabilensin",
    "Hayatıma mana katabilenlerdensin",
    "Hiç gitmeyecek biricik kalbimsin",
  ];
  List<String> images = [
    "assets/img/oneAsk.jpeg",
    "assets/img/twoAsk.jpeg",
    "assets/img/threeAsk.jpeg",
    "assets/img/dortAsk.jpeg",
    "assets/img/besAsk.jpeg",
    "assets/img/altiAsk.jpeg",
  ];

  int currentIndex = 0;

  int _counter = 120; // start countdown from 180 seconds

  String quote = "";
  @override
  void initState() {
    super.initState();
    _getRandomQuote();
    Timer.periodic(Duration(seconds: 10), (timer) => _getRandomQuote());
    Timer(Duration(minutes: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GoOrWent(),
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

  void _getRandomQuote() {
    setState(() {
      quote = quotes[Random().nextInt(quotes.length)];
    });
  }

  Widget _siirimsi() {
    var text;
    if (_counter <= 115) {
      text = Text(
        quote,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      );
    } else {
      text = Text("");
    }
    return text;
  }

  final GlobalKey<_HomePageState> _myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double heightAz = screenHeight / 2;
    double heightBold = heightAz - 20;
    return Stack(
      children: <Widget>[
        PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              spawnMinRadius: 9,
              spawnMaxRadius: 18,
              baseColor: Colors.red.withOpacity(0.1),
              spawnMinSpeed: 20,
              spawnMaxSpeed: 70,
              particleCount: 20,
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
          padding: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "$_counter saniye kaldi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Digital',
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          right: 50,
          child: Column(
            children: <Widget>[
              _siirimsi(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          currentIndex == index ? Colors.white : Colors.white38,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.025),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  "İyi ki varsın!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontFamily: 'OoohBaby',
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  "by Marijua",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OoohBaby',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
