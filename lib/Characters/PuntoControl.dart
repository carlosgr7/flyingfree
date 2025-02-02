import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flyingfree/Bodies/BirdBody.dart';
import 'package:flyingfree/Characters/Bird.dart';
import 'package:flyingfree/Games/FlyingFreeGame.dart';


class PuntoControl extends SpriteAnimationComponent with HasGameReference<FlyingFree>, CollisionCallbacks{


  final effect = GlowEffect(
    10.0,
    EffectController(duration: 3),
  );

  PuntoControl({required super.position,}):super(size: Vector2(50,300), anchor: Anchor.center);

  @override
  void onLoad() {


    add(CircleHitbox(collisionType: CollisionType.passive));

  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart

    if(other is Bird){

      removeFromParent();


    }

    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {

    super.onCollisionEnd(other);
    
  }



}