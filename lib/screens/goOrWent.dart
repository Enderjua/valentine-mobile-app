import 'package:app/screens/homePage.dart';
import 'package:app/screens/randomDate.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class GoOrWent extends StatefulWidget {
  const GoOrWent({Key? key}) : super(key: key);
  _GoOrWentState createState() => _GoOrWentState();
}

class _GoOrWentState extends State<GoOrWent>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/AskBiz.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              spawnMinRadius: 12,
              spawnMaxRadius: 18,
              baseColor: Colors.red.withOpacity(0.1),
              spawnMinSpeed: 20,
              spawnMaxSpeed: 80,
              particleCount: 14,
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
          children: <Widget>[
            Center(
              child: Text(
                "Lütfen birini seçiniz!",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: RaisedButton(
                      child: Text("Geri Dön"),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: RaisedButton(
                      child: Text("Devam Et"),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RandomDate(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
