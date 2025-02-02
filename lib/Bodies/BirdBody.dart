import 'package:flame/components.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/contact_callbacks.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Characters/Bird.dart';

class BirdBody extends BodyComponent with KeyboardHandler, ContactCallbacks{

  final Vector2 initialPosition;
  late FixtureDef miFixtureDef;
  late BodyDef miBodyDef;
  late Bird birdSkin;

  //Variables que controlan el movimiento
  int horizontalDirection = 0;
  int verticalDirection = 0;
  final double aceleracion = 50;
  final double jumpSpeed = 50;

  BirdBody(this.initialPosition) : super(renderBody: false);

  @override
  Future<void> onLoad() {
    debugMode = false;
    birdSkin = Bird(position: Vector2(0, 0));
    add(birdSkin);
    return super.onLoad();
  }

  @override
  Body createBody() {
    miFixtureDef = FixtureDef(
      PolygonShape()..setAsBox(24, 24, Vector2.zero(), 0), // Rectángulo como cuerpo
      restitution: 0.0, // Sin rebote
      friction: 0.4,
      density: 10,
    );

    miBodyDef = BodyDef(
      userData: this,
      angularDamping: 0.8, // Controla el rebote angular
      position: initialPosition ?? Vector2.zero(),
      type: BodyType.dynamic, // El cuerpo será dinámico
    );

    return world.createBody(miBodyDef)..createFixture(miFixtureDef);
  }


  @override
  void update(double dt) {
    super.update(dt);

    body.linearVelocity = Vector2(aceleracion, body.linearVelocity.y);

    if (birdSkin.scale.x < 0) {
      birdSkin.flipHorizontally();
    }

  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      print("Salto realizado");

      body.linearVelocity = Vector2(body.linearVelocity.x, -jumpSpeed);

    }

    return super.onKeyEvent(event, keysPressed);
  }



}