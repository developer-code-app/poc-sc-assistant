import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/pages/home/home.dart';

class HomeRoutePath extends RoutePath {
  @override
  Widget buildPage(BuildContext context) {
    return const HomePage();
  }
}
