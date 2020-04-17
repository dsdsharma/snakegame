import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:snakegame/game-controller.dart';

import 'package:snakegame/sketch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Sketch sketch = Sketch();

  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: <Widget>[
          sketch.widget,
          GameController(sketch:sketch),
        ],
      ),
    ),
  );
}
