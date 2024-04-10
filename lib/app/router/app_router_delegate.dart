import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/app/router/route_path_flow.dart';
import 'package:poc_sc_assistant/cubits/router_cubit.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with
        // ignore: prefer_mixin
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<RoutePath> {
  AppRouterDelegate({required this.navigatorKey});

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final cubit = context.read<RouterCubit>();
        if (await cubit.preExecutionOnPop()) {
          if (cubit.canPop()) {
            cubit.pop();
            return false;
          } else {
            return !cubit.tryPopHomePage();
          }
        } else {
          return false;
        }
      },
      child: BlocBuilder<RouterCubit, List<RoutePathFlow>>(
        builder: (context, paths) {
          return Navigator(
            key: navigatorKey,
            observers: [context.read<RouterCubit>().routeObserver],
            pages: paths
                .map((flow) => flow.buildPageFlow(context))
                .expand((pages) => pages.map((p) => MaterialPage(child: p)))
                .toList(),
            onPopPage: (route, result) {
              final cubit = context.read<RouterCubit>();
              cubit.pop(isNotified: true);
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }

  @override
  // ignore: avoid_returning_null_for_void
  Future<void> setNewRoutePath(RoutePath configuration) async => null;
}
