import 'dart:ui';
import 'package:snakegame/sketch.dart';

class Snake {
  List<double> dx;
  List<double> dy;
  int rez = 10;

  double xdir;
  double ydir;
  final Sketch game;
  Offset position = Offset.zero;
  Snake(this.game, {this.position});

  // this.dx[0] = 0.0;
  //this.dy[0] = 0.0;
  //this.body[0] = Offset(0,0);
  // this.xdir = 0;
  //this.ydir = 0;
  // print('Value of offset dsdddddddddd'+(body[0].dx).toString());

  void render(Canvas c) {
    Paint snakeColor = Paint()..color = Color(0xffdddddd);
    c.save();

    c.translate(position.dx, position.dy);
    Rect snake = Rect.fromLTWH(position.dx, position.dy, 20, 20);

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
