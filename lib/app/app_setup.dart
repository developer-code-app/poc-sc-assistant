import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/app.dart';
import 'package:poc_sc_assistant/app/bloc/app_bloc.dart';
import 'package:poc_sc_assistant/app/router/paths/main_tab_bar_navigator_route_path.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart';
import 'package:poc_sc_assistant/cubits/router_cubit.dart';
import 'package:poc_sc_assistant/providers/api/api_provider.dart';
import 'package:poc_sc_assistant/repositories/home_repository.dart';

Future<void> setupApp(App app) async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiProvider = ApiProvider.basic();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
    (value) => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<HomeRepository>(
            create: (context) => HomeRepository(
              apiProvider: apiProvider,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>(
              create: (context) => AppBloc()..add(AppStarted()),
            ),
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(
                repository: context.read<HomeRepository>(),
              ),
            ),
            BlocProvider<RouterCubit>(
              create: (context) => RouterCubit(MainTabBarNavigatorRoutePath()),
            ),
          ],
          child: app,
        ),
      ),
    ),
  );
}
