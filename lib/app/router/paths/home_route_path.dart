import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/app/router/route_path.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart';
import 'package:poc_sc_assistant/cubits/user_profile_cubit.dart';
import 'package:poc_sc_assistant/pages/home/bloc/home_page_bloc.dart';
import 'package:poc_sc_assistant/pages/home/home_page.dart';

class HomeRoutePath extends RoutePath {
  @override
  Widget buildPage(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc(
            homeCubit: context.read<HomeCubit>(),
            userProfileCubit: context.read<UserProfileCubit>(),
          )..add(StartedEvent()),
        ),
      ],
      child: const HomePage(),
    );
  }
}
