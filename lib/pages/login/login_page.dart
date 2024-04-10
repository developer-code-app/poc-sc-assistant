import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/bloc/app_bloc.dart';
import 'package:poc_sc_assistant/widgets/page/page_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Login Page',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final event = AppLoggedIn(
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    );

    appBloc.add(event);
  }
}
