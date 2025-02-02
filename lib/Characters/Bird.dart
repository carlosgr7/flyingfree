import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flyingfree/Characters/PuntoControl.dart';
import 'package:flyingfree/Colisiones/RectangularColision.dart';
import 'package:flyingfree/Games/FlyingFreeGame.dart';

class Bird extends SpriteAnimationComponent
    with HasGameReference<FlyingFree>, KeyboardHandler, CollisionCallbacks{

  Bird({required super.position,}) :
        super(size: Vector2(64,64), anchor: Anchor.center);

  int iStars = 0;
  int get stars => iStars;


  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('bird1.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );

    //add(CircleHitbox(collisionType: CollisionType.active));
  }

  @override render(Canvas canvas){
    super.render(canvas);

  }

  @override
  void update(double dt) {
    super.update(dt);


  }

  @override void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);

    if(other is PuntoControl){
      print("colision");
      iStars++;
      game.collectStar();
    }

    if(other is RectangularColision){
      game.showGameOverScreen();
    }
  }

}