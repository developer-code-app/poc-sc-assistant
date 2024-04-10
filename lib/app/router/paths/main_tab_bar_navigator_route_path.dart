import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/pages/main_tab_bar_navigator/main_tab_bar_navigator_page.dart';

class MainTabBarNavigatorRoutePath extends RoutePath {
  @override
  Widget buildPage(BuildContext context) {
    return const MainTabBarNavigatorPage();
  }
}
