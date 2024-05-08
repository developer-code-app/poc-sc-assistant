import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart';
import 'package:poc_sc_assistant/pages/scenes/bloc/scenes_page_bloc.dart';
import 'package:poc_sc_assistant/pages/scenes/scenes_page.dart';

class ScenesRoutePath extends RoutePath {
  @override
  Widget buildPage(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScenesPageBloc>(
          create: (context) => ScenesPageBloc(
            homeCubit: context.read<HomeCubit>(),
          )..add(StartedEvent()),
        ),
      ],
      child: const ScenesPage(),
    );
  }
}
