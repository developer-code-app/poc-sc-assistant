import 'package:flutter/material.dart';

enum PageSize { small, regular, large }

enum SupportedTheme { light }

abstract class AppTheme {
  AppTheme({
    required this.typography,
    required this.fontColor,
  });

  final Typography typography;
  final FontColor fontColor;

  AppTheme theme(PageSize pageSize);
}

class Typography {
  Typography({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.body1,
    required this.body2,
    required this.overline,
  });

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle overline;
}

class FontColor {
  FontColor({
    required this.textDefault,
    required this.error,
  });

  final Color textDefault;
  final Color error;
}
