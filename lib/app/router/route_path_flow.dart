import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/exceptions/app_exception.dart';

class RoutePathFlow<T extends BlocBase<Object?>> {
  RoutePathFlow({
    required this.paths,
    this.bloc,
  });

  T? bloc;
  List<RoutePath> paths;

  List<Widget> buildPageFlow(BuildContext context) {
    if (bloc != null) {
      return paths
          .map(
            (path) => MultiBlocProvider(
              providers: [BlocProvider.value(value: bloc!)],
              child: path.buildPage(context),
            ),
          )
          .toList();
    } else {
      return paths.map((path) => path.buildPage(context)).toList();
    }
  }

  void push(RoutePath path) => paths..add(path);

  void pop() {
    if (canPop()) {
      paths.removeLast();
    }
  }

  void popUntil(Type route) {
    if (isRouteExist(route)) {
      final index = paths.lastIndexWhere(
        (element) => element.runtimeType == route,
      );

      _popN(paths.length - index - 1);
    } else {
      throw AppException(StateError('Route $route not found.'));
    }
  }

  void _popN(int number) {
    if (canPopN(number)) {
      paths.removeRange(paths.length - number, paths.length);
    } else {
      throw AppException(StateError('Pop number out of range'));
    }
  }

  void dispose() {
    unawaited(bloc?.close());
  }

  bool isRouteExist(Type route) {
    final index = paths.lastIndexWhere(
      (element) => element.runtimeType == route,
    );

    return index >= 0;
  }

  bool canPop() => paths.length > 1;
  bool canPopN(int n) => n > 0 && paths.length > n;

  RoutePathFlow<T> copyWith({
    T? bloc,
    List<RoutePath>? paths,
  }) {
    return RoutePathFlow(
      bloc: bloc ?? this.bloc,
      paths: paths ?? this.paths,
    );
  }
}
