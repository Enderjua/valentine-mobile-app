import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:io';

class NotFinish extends StatefulWidget {
  const NotFinish({Key? key}) : super(key: key);

  @override
  _NotFinishState createState() => _NotFinishState();
}

class _NotFinishState extends State<NotFinish> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache play = AudioCache();
  bool isLocal = true;
  double spawnMinRadius = 15;
  double spawnMaxRadius = 30;
  double spawnMinSpeed = 25;
  double spawnMaxSpeed = 90;
  int particleCount = 22;
  final musicUrl = 'lib/music/uyu.mp3'; // Adjusted to a string

  @override
  void initState() {
    super.initState();
    _initPlayer();
    play.load('assets/music/uyu.mp3');
    Timer _timer = Timer.periodic(Duration(seconds: 7), (timer) {
      setState(() {
        if (spawnMinRadius > 2) {
          spawnMinRadius--;
        }
        if (spawnMaxRadius > 5) {
          spawnMaxRadius--;
        }
        if (spawnMinSpeed > 10) {
          spawnMinSpeed--;
        }
        if (spawnMaxSpeed > 14) {
          spawnMaxSpeed--;
        }
        if (particleCount > 1) {
          particleCount--;
        }
      });
    });
  }

  Future<void> _initPlayer() async {
    await _audioPlayer.setSourceUrl(musicUrl); // Correct initialization
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
                spawnMinRadius: spawnMinRadius,
                spawnMaxRadius: spawnMaxRadius,
                baseColor: Colors.red.withOpacity(0.1),
                spawnMinSpeed: spawnMinSpeed,
                spawnMaxSpeed: spawnMaxSpeed,
                particleCount: particleCount,
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
        ],
      ),
    );
  }
}
