import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';

import 'package:snakegame/components/snake.dart';
import 'package:snakegame/helpers/directions.dart';

class Sketch extends Game {
  String lastMove = '';
  double xMovement = 0;
  double yMovement = 0;
  Snake snake;
  Size screenSize;
  Sketch() {
    initialize();
  }
  void initialize() async {
    resize(await Flame.util.initialDimensions());
    if (snake == null) {
      snake = Snake(
        this,
        position: Offset(screenSize.width / 2, screenSize.height / 2),
      );
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();

    bgPaint.color = Color(0xff805E73);
    canvas.drawRect(bgRect, bgPaint);
    snake.render(canvas);
  }

  @override
  void update(double t) {
    // TODO: implement update
    // make snake move
    if (lastMove == 'x') {
      if (xMovement < 0) {
        snake.direction = Direction.left;
        snake.position = snake.position.translate(-100 * t, 0);
      }
      if (xMovement > 0) {
        snake.direction = Direction.right;
        snake.position = snake.position.translate(100 * t, 0);
      }
    }
    if (lastMove == 'y') {
      if (yMovement < 0) {
        snake.direction = Direction.up;
        snake.position = snake.position.translate(0, -100 * t);
      }
      if (yMovement > 0) {
        snake.direction = Direction.down;
        snake.position = snake.position.translate(0, 100 * t);
      }
    }
  }

  @override
  void resize(Size size) {
    // TODO: implement resize
    super.resize(size);
    screenSize = size;
  }

  void onUpDragStart(DragDownDetails d) {
    yMovement += -1;
    lastMove = 'y';
  }

  void onUpDragEnd(DragEndDetails d) {
    yMovement += 1;
  }

  void onRightDragStart(DragDownDetails d) {
    xMovement += 1;
    lastMove = 'x';
  }

  void onRightDragEnd(DragEndDetails d) {
    xMovement += -1;
  }

  void onDownDragStart(DragDownDetails d) {
    yMovement += 1;
    lastMove = 'y';
  }

  void onDownDragEnd(DragEndDetails d) {
    yMovement += -1;
  }

  void onLeftDragStart(DragDownDetails d) {
    xMovement += -1;
    lastMove = 'x';
  }

  void onLeftDragEnd(DragEndDetails d) {
    xMovement += 1;
  }
}
