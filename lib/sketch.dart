import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';

import 'package:snakegame/components/snake.dart';

class Sketch extends Game {
  String lastMove = '';
  double xMovement = 1;
  double yMovement = 0;
  Snake snake;
  Size screenSize;
  List<Offset> body = List<Offset>();
  Sketch() {
    body.add(Offset(0, 0));
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    snake = Snake(
      this,
      position: body[0],
    );
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();

    bgPaint.color = Color(0xff805E73);
    canvas.drawRect(bgRect, bgPaint);
    snake.render(canvas);
  }

  @override
  void update(double t) {
    this.body[0] += Offset(xMovement, yMovement);
    snake.position += Offset(xMovement,yMovement);


    // Code ment to rotate the object on its axis
    // if (lastMove == 'x') {
    //   if (xMovement < 0) {
    //     snake.direction = Direction.left;
    //     snake.position = snake.position.translate(-100 * t, 0);
    //   }
    //   if (xMovement > 0) {
    //     snake.direction = Direction.right;
    //     snake.position = snake.position.translate(100 * t, 0);
    //   }
    // }
    // if (lastMove == 'y') {
    //   if (yMovement < 0) {
    //     snake.direction = Direction.up;
    //     snake.position = snake.position.translate(0, -100 * t);
    //   }
    //   if (yMovement > 0) {
    //     snake.direction = Direction.down;
    //     snake.position = snake.position.translate(0, 100 * t);
    //   }
    // }
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }


  //Functions setting value for direction change
  void onUpDragStart(DragDownDetails d) {
    xMovement = 0;
    yMovement = -1;
    lastMove = 'y';
  }

  void onRightDragStart(DragDownDetails d) {
    xMovement = 1;
    yMovement=0;
    lastMove = 'x';
  }

  void onDownDragStart(DragDownDetails d) {
    xMovement = 0;
    yMovement = 1;
    lastMove = 'y';
  }

  void onLeftDragStart(DragDownDetails d) {
    xMovement = -1;
    yMovement = 0;
    lastMove = 'x';
  }
}
