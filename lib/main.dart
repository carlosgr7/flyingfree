import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flyingfree/Games/FlyingFreeGame.dart';

void main() {

  runApp(
    GameWidget<FlyingFree>.controlled(
      gameFactory: FlyingFree.new,
      overlayBuilderMap: {
      },
      //initialActiveOverlays: const ['MainMenu'],
    ),
  );
}




