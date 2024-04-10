import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/app_theme.dart' as app_theme;

class LightTheme extends app_theme.AppTheme {
  LightTheme({app_theme.PageSize? pageSize})
      : super(
          typography: app_theme.Typography(
            headline1: _baseText.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            headline2: _baseText.copyWith(
              fontSize: pageSize == app_theme.PageSize.small ? 28 : 32,
              fontWeight: FontWeight.bold,
            ),
            headline3: _baseText.copyWith(
              fontSize: pageSize == app_theme.PageSize.small ? 16 : 24,
              fontWeight: FontWeight.bold,
            ),
            headline4: _baseText.copyWith(
              fontSize: pageSize == app_theme.PageSize.small ? 16 : 20,
              fontWeight: FontWeight.bold,
            ),
            body1: _baseText,
            body2: _baseText.copyWith(
              fontSize: pageSize == app_theme.PageSize.small ? 14 : 16,
            ),
            overline: _baseText.copyWith(
              fontSize: 12,
            ),
          ),
          fontColor: app_theme.FontColor(
            textDefault: Colors.black,
            error: Colors.red,
          ),
        );

  @override
  app_theme.AppTheme theme(
    app_theme.PageSize pageSize,
  ) =>
      LightTheme(pageSize: pageSize);

  static const TextStyle _baseText = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );
}
