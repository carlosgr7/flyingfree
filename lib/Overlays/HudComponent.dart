import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/text.dart';

class HudComponent extends PositionComponent {

  late TextComponent coinsText;

  late SpriteComponent coinsIcon;



  int stars = 0;


  HudComponent();

  @override
  Future<void> onLoad() async {
    super.onLoad();


    coinsIcon = SpriteComponent()
      ..sprite = await Sprite.load('star.png')
      ..size = Vector2(50, 50)
      ..position = Vector2(10, 90);

    coinsText = TextComponent(
      text: 'Estrellas: $stars',
      textRenderer: TextPaint(
        style: TextStyle(
          fontFamily: 'Roboto',
          color: const Color(0xFFFF0000),
          fontSize: 50,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: const Color(0xFF000000),
            ),
          ],
        ),
      ),
    )..position = Vector2(80, 90);


    add(coinsIcon);
    add(coinsText);

  }

  @override
  void update(double dt) {
    super.update(dt);
  }



  void updateStars(int value) {
    stars = value;
    coinsText.text = 'Monedas: $stars';
  }

}
