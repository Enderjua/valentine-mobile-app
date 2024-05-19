import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'dart:js';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RandomParticleBehaviour extends ParticleBehaviour {
  static math.Random random = math.Random();

  /// Creates a new random particle behaviour.
  RandomParticleBehaviour({
    ParticleOptions options = const ParticleOptions(),
    Paint? paint,
  }) : super(options: options, paint: paint);

  @override
  void initFrom(Behaviour oldBehaviour) {
    super.initFrom(oldBehaviour);
    if (oldBehaviour is RandomParticleBehaviour || particles == null) return;
    for (Particle particle in particles!) {
      initParticle(particle);
    }
  }

  @override
  void initParticle(Particle p) {
    initPosition(p);
    initRadius(p);

    final double deltaSpeed = (options.spawnMaxSpeed - options.spawnMinSpeed);
    double speed = random.nextDouble() * deltaSpeed + options.spawnMinSpeed;
    initDirection(p, speed);

    final double deltaOpacity = (options.maxOpacity - options.minOpacity);
    p.alpha = options.spawnOpacity;
    p.targetAlpha = random.nextDouble() * deltaOpacity + options.minOpacity;
  }

  /// Initializes a new position for the provided [Particle].
  @protected
  void initPosition(Particle p) {
    p.cx = random.nextDouble() * size!.width;
    p.cy = random.nextDouble() * size!.height;
  }

  /// Initializes a new radius for the provided [Particle].
  @protected
  void initRadius(Particle p) {
    final deltaRadius = (options.spawnMaxRadius - options.spawnMinRadius);
    p.radius = random.nextDouble() * deltaRadius + options.spawnMinRadius;
  }

  /// Initializes a new direction for the provided [Particle].
  @protected
  void initDirection(Particle p, double speed) {
    double dirX = random.nextDouble() - 0.5;
    double dirY = random.nextDouble() - 0.5;
    double magSq = dirX * dirX + dirY * dirY;
    double mag = magSq <= 0 ? 1 : math.sqrt(magSq);

    p.dx = dirX / mag * speed;
    p.dy = dirY / mag * speed;
  }

}
