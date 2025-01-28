import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class FlyingFree extends Forge2DGame with HasKeyboardHandlerComponents,HasCollisionDetection{

  FutureOr<void> onLoad() async {
    await super.onLoad();
    // TODO: implement onLoad
    debugMode = false;
    await images.loadAll([
      'Background1.png',
      'Background2.png',
      'Background3.png',
      'Background4.png',
      'Background5.png',
      'Background6.png',
      'Background7.png',
      'Background8.png',
      'Background9.png'

    ]);

    Future<ParallaxComponent> bgParallax() async {
      ParallaxComponent parallaxComponent = await loadParallaxComponent([
        ParallaxImageData('Background1.png'),


      ], baseVelocity: Vector2(10, 0),
          velocityMultiplierDelta: Vector2(1.5, 0));
      return parallaxComponent;
    }

    add(await bgParallax());
  }
}