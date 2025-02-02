import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flyingfree/Bodies/BirdBody.dart';
import 'package:flyingfree/Characters/PuntoControl.dart';
import 'package:flyingfree/Overlays/GameOverOverlay.dart';
import 'package:flyingfree/Overlays/HudComponent.dart';

import '../Colisiones/RectangularColision.dart';

class FlyingFree extends Forge2DGame with HasKeyboardHandlerComponents,HasCollisionDetection{

  late BirdBody _birdBody;
  late HudComponent hud;

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
      'Background9.png',
      'bird1.png',
      'star.png'

    ]);

    await FlameAudio.audioCache.load('coincollect.mp3');

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

    hud = HudComponent();
    add(hud);

    _birdBody = BirdBody(Vector2(50,100));

    add(_birdBody);





    final colisiones_rectangulos = mapa1.tileMap.getLayer<ObjectGroup>('colisiones_rectangulos');
    for (final rectColision in colisiones_rectangulos!.objects) {
      add(RectangularColision(Vector2(rectColision.x*3.05, rectColision.y*2),
          Vector2(rectColision.width*3.05, rectColision.height*2)));
    }

    final puntos_control = mapa1.tileMap.getLayer<ObjectGroup>('puntos_control');
    for (final puntosControl in puntos_control!.objects) {
      add(PuntoControl(position: Vector2(puntosControl.x*3.05, puntosControl.y*2.5 )));
    }



    camera.viewfinder.zoom=0.7;
    camera.viewfinder.anchor=const Anchor(0.1, 0.5);

    camera.follow(_birdBody);




  }

  void collectStar() {

    FlameAudio.play('coincollect.mp3', volume: .75);
  }

  void showGameOverScreen() {
    pauseEngine();
    overlays.add('GameOverOverlay');
  }

  void restart() {

    _birdBody = BirdBody(Vector2(50, 100));
    add(_birdBody);


  }


}