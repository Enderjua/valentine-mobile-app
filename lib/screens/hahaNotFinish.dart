import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:async';
import 'dart:io';

class NotFinish extends StatefulWidget {
  const NotFinish({Key? key}) : super(key: key);
  _NotFinishState createState() => _NotFinishState();
}

class _NotFinishState extends State<NotFinish>
    with SingleTickerProviderStateMixin {
  AudioPlayer _audioPlayer = AudioPlayer();
  final play = AudioCache();
  bool isLocal = true;
  double spawnMinRadius = 15;
  double spawnMaxRadius = 30;
  double spawnMinSpeed = 25;
  double spawnMaxSpeed = 90;
  int particleCount = 22;
  final musicUrl = DeviceFileSource('lib/music/uyu.mp3');
  final player = AudioPlayer();                   // Create a player
final duration = await player.setUrl(           // Load a URL
    'https://foo.com/bar.mp3');                 // Schemes: (https: | file: | asset: )
player.play();                                  // Play without waiting for completion


  void initState() {
    // _audioPlayer.play(musicUrl, volume: 1);
    super.initState();
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
