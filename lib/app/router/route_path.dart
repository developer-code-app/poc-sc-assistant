import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

abstract class RoutePath {
  final pageScaffoldKey = GlobalKey<PageScaffoldState>();

  Widget buildPage(BuildContext context);

  Future<bool> preExecutionOnPop() =>
      pageScaffoldKey.currentState?.widget.preExecutionOnPop?.call() ??
      Future.value(true);
}
