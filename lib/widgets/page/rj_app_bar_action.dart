import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/cubits/app_theme_cubit.dart';
import 'package:poc_sc_assistant/exceptions/app_exception.dart';

class RJAppBarAction {
  RJAppBarAction({
    required this.child,
    this.onPressed,
  });

  RJAppBarChild child;
  void Function()? onPressed;

  Widget build(BuildContext context) {
    final appTheme = context.read<AppThemeCubit>().state;
    final typography = appTheme.typography;
    final child = this.child;

    if (child is TextAction) {
      return GestureDetector(
        onTap: onPressed,
        child: Text(
          child.text,
          style: child.style ?? typography.body2,
          maxLines: 1,
        ),
      );
    } else if (child is WidgetAction) {
      return GestureDetector(
        onTap: onPressed,
        child: child.widget,
      );
    } else {
      throw AppException(
        UnimplementedError('Unsupported ${child.runtimeType}.'),
      );
    }
  }
}

abstract class RJAppBarChild {}

class TextAction extends RJAppBarChild {
  TextAction(
    this.text, {
    this.style,
  });

  final String text;
  final TextStyle? style;
}

class WidgetAction extends RJAppBarChild {
  WidgetAction(this.widget);

  final Widget widget;
}
