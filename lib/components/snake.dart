import 'dart:ui';
import 'package:snakegame/sketch.dart';
import 'package:snakegame/helpers/directions.dart';
import 'dart:math';

class Snake {
  Direction direction = Direction.up;
  final Sketch game;
  Offset position = Offset.zero;
  Snake(this.game, {this.position});

  void render(Canvas c) {
    Paint snakeColor = Paint()..color = Color(0xffdddddd);
    c.save();
    c.translate(position.dx, position.dy);
    Rect snake = Rect.fromLTWH(0, 0, 30, 30);

    c.drawRect(snake, snakeColor);
    //TEST: Moving by on unit in particular direction
    // switch (direction) {
    //   case Direction.up:
    //     c.translate(position.dx, position.dy);
    //     break;
    //   case Direction.right:
    //     c.translate(position.dx, position.dy);
    //     break;
    //   case Direction.down:
    //     c.translate(position.dx, position.dy);
    //     break;
    //   case Direction.left:
    //     c.translate(position.dx, position.dy);
    //     break;
    // }
  }
}
