import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/app.dart';
import 'package:poc_sc_assistant/app/bloc/app_bloc.dart';

Future<void> setupApp(App app) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
    (value) => runApp(
      BlocProvider<AppBloc>(
        create: (context) => AppBloc()..add(AppStarted()),
        child: app,
      ),
    ),
  );
}
