import 'package:flutter/material.dart';
import 'package:snakegame/sketch.dart';

class GameController extends StatelessWidget {
  final Sketch sketch;

  const GameController({Key key, @required this.sketch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //Key Buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //first row
              Row(
                children: [
                  SizedBox(width: 50),
                  //*up button
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_up, size: 32),
                      ),
                    ),
                    onPanDown: sketch.onUpDragStart,
                    onPanEnd: sketch.onUpDragEnd,
                  ),
                  SizedBox(width: 50),
                ],
              ),
              Row(
                children: [
                  //*left button
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_left, size: 32),
                      ),
                    ),
                    onPanDown: sketch.onLeftDragStart,
                    onPanEnd: sketch.onLeftDragEnd,
                  ),
                  SizedBox(width: 50),
                  //*right button
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_right, size: 32),
                      ),
                    ),
                    onPanDown: sketch.onRightDragStart,
                    onPanEnd: sketch.onRightDragEnd,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 50),
                  //*down button
                  GestureDetector(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(0xffffffff),
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_down, size: 32),
                      ),
                    ),
                    onPanDown: sketch.onDownDragStart,
                    onPanEnd: sketch.onDownDragEnd,
                  ),
                  SizedBox(width: 50),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
