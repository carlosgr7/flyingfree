import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class RectangularColision extends BodyComponent with ContactCallbacks{

  final Vector2 initialPosition;
  final Vector2 initialSize;

  RectangularColision(this.initialPosition, this.initialSize):super(renderBody: false);

  @override
  Body createBody() {
    // TODO: implement createBody
    Vector2 posFinal=initialPosition+initialSize;
    //final shape = EdgeShape()..set(initialPosition, posFinal);
    final shape = PolygonShape()..set([
      initialPosition,
      Vector2(posFinal.x, initialPosition.y),
      posFinal,
      Vector2(initialPosition.x, posFinal.y),
    ]);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
        position: Vector2(0, 0),
        userData: this
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    super.beginContact(other, contact);
  }

}