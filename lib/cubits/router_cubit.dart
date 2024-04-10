import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/app/router/route_path_flow.dart';
import 'package:poc_sc_assistant/exceptions/app_exception.dart';

class RouterCubit extends Cubit<List<RoutePathFlow>> {
  RouterCubit(RoutePath routePath)
      : super([
          RoutePathFlow(paths: [routePath]),
        ]);

  final routeObserver = RouteObserver();
  final navigatorKey = GlobalKey<NavigatorState>();
  int tabBarPageIndex = 0;

  RoutePath get currentRoutPath => currentFlow.paths.last;
  RoutePathFlow get currentFlow => state.last;

  StreamSubscription? _broadcasterSubscription;

  @override
  Future<void> close() {
    _broadcasterSubscription?.cancel();

    return super.close();
  }

  void push(RoutePath path) {
    if (state.isEmpty) {
      pushFlow(RoutePathFlow(paths: [path]));
    } else {
      state.last.paths.add(path);
      emit(List.from(state));
    }
  }

  void pushReplacement(RoutePath newPath) {
    state.last.paths
      ..removeLast()
      ..add(newPath);

    emit(List.from(state));
  }

  void pushReplacementFlow(RoutePathFlow flow) {
    state
      ..removeLast()
      ..add(flow);

    emit(List.from(state));
  }

  void pushFlow(RoutePathFlow flow) {
    emit(List.from(state..add(flow)));
  }

  void pop({bool isNotified = false}) {
    if (canPop()) {
      if (state.last.canPop()) {
        if (isNotified) {
          state.last.pop();
        } else {
          navigatorKey.currentState?.pop();
        }
      } else {
        popFlow();
      }

      emit(List.from(state));
    }
  }

  void popFlow() {
    if (canPopFlow()) {
      state.last.dispose();
      emit(List.from(state..removeLast()));
    }
  }

  void popUntil(Type route) {
    if (canPopUntil(route)) {
      final flow = state.lastWhere((flow) => flow.isRouteExist(route));

      if (flow.paths.last.runtimeType != route) {
        flow.popUntil(route);
        emit(List.from(state));
      } else {
        throw AppException(
          StateError(
            "RouterCubit doesn't support pop until to presenting $route.",
          ),
        );
      }
    } else {
      throw AppException(StateError('Route $route not found.'));
    }
  }

  bool tryPopHomePage() {
    if (tabBarPageIndex == 0) {
      return false;
    } else {
      tabBarPageIndex = 0;
      emit(List.from(state));

      return true;
    }
  }

  void restart(RoutePath path) {
    restartWithFlow(RoutePathFlow(paths: [path]));
  }

  void restartWithFlow(RoutePathFlow flow) {
    emit([flow]);
  }

  bool canPop() => canPopFlow() || (state.length == 1 && state.last.canPop());
  bool canPopFlow() => state.length > 1;
  bool canPopUntil(Type route) => state.any((flow) => flow.isRouteExist(route));
  Future<bool> preExecutionOnPop() => state.last.paths.last.preExecutionOnPop();
}
