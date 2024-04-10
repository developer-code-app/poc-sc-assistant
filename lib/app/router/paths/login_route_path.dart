import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/pages/login/login_page.dart';

class LoginRoutePath extends RoutePath {
  @override
  Widget buildPage(BuildContext context) {
    return const LoginPage();
  }
}
