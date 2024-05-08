import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/app.dart';
import 'package:poc_sc_assistant/app/bloc/app_bloc.dart';
import 'package:poc_sc_assistant/app/router/paths/main_tab_bar_navigator_route_path.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart';
import 'package:poc_sc_assistant/cubits/router_cubit.dart';
import 'package:poc_sc_assistant/cubits/user_profile_cubit.dart';
import 'package:poc_sc_assistant/providers/api/api_provider.dart';
import 'package:poc_sc_assistant/repositories/home_repository.dart';
import 'package:poc_sc_assistant/repositories/user_repository.dart';

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
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(
              apiProvider: apiProvider,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(
                repository: context.read<HomeRepository>(),
              ),
            ),
            BlocProvider<RouterCubit>(
              create: (context) => RouterCubit(MainTabBarNavigatorRoutePath()),
            ),
            BlocProvider<UserProfileCubit>(
              create: (context) => UserProfileCubit(
                repository: context.read<UserRepository>(),
              ),
            ),
            BlocProvider<AppBloc>(
              create: (context) => AppBloc(
                userProfileCubit: context.read<UserProfileCubit>(),
              )..add(AppStarted()),
            ),
          ],
          child: app,
        ),
      ),
    ),
  );
}
