import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flyingfree/Games/FlyingFreeGame.dart';

class Bird extends SpriteAnimationComponent
    with HasGameReference<FlyingFree>, KeyboardHandler, CollisionCallbacks{

  Bird({required super.position,}) :
        super(size: Vector2(64,64), anchor: Anchor.center);

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

}