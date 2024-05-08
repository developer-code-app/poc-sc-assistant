import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/app_theme.dart';
import 'package:poc_sc_assistant/app/bloc/app_bloc.dart';
import 'package:poc_sc_assistant/app/router/app_router_delegate.dart';
import 'package:poc_sc_assistant/app/router/paths/login_route_path.dart';
import 'package:poc_sc_assistant/app/router/paths/main_tab_bar_navigator_route_path.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/app/themes/light_theme.dart';
import 'package:poc_sc_assistant/cubits/app_theme_cubit.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart' as home_cubit;
import 'package:poc_sc_assistant/cubits/router_cubit.dart';
import 'package:poc_sc_assistant/cubits/user_profile_cubit.dart';
import 'package:poc_sc_assistant/repositories/home_repository.dart';
import 'package:poc_sc_assistant/repositories/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeCubit>(
          create: (context) => AppThemeCubit(
            theme: LightTheme(pageSize: PageSize.regular),
          ),
        ),
        BlocProvider<home_cubit.HomeCubit>(
          create: (context) => home_cubit.HomeCubit(
            repository: context.read<HomeRepository>(),
          )..loadData(),
        ),
        BlocProvider<UserProfileCubit>(
          create: (context) => UserProfileCubit(
            repository: context.read<UserRepository>(),
          )..loadData(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'SC Assistant',
            themeMode: ThemeMode.light,
            theme: ThemeData(),
            home: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    AppState state,
  ) {
    if (state is AppLoadSuccess) {
      return _buildAppLoadSuccess(context, state);
    } else if (state is AppUnauthorized) {
      return _buildAppUnauthorized(context, state);
    } else {
      return Container();
    }
  }

  Widget _buildAppLoadSuccess(
    BuildContext context,
    AppLoadSuccess state,
  ) {
    return _buildRouter(
      context,
      rootRoutePath: MainTabBarNavigatorRoutePath(),
    );
  }

  Widget _buildAppUnauthorized(
    BuildContext context,
    AppUnauthorized state,
  ) {
    return _buildRouter(
      context,
      rootRoutePath: LoginRoutePath(),
    );
  }

  Widget _buildRouter(
    BuildContext context, {
    required RoutePath rootRoutePath,
  }) {
    final routerCubit = context.read<RouterCubit>();
    final rootPath = routerCubit.state.first.paths.first;

    if (rootPath.runtimeType != rootRoutePath.runtimeType) {
      routerCubit.restart(rootRoutePath);
    }

    return Builder(
      builder: (context) => Router(
        routerDelegate: AppRouterDelegate(
          navigatorKey: routerCubit.navigatorKey,
        ),
      ),
    );
  }
}
