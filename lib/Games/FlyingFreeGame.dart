import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_tiled/flame_tiled.dart';

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

    TiledComponent mapa1 = await TiledComponent.load("mapa1.tmx", Vector2(128, 128));
    mapa1.scale = Vector2(0.38, 0.25);
    add(mapa1);

  }
}