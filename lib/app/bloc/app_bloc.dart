import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:poc_sc_assistant/cubits/user_profile_cubit.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.userProfileCubit}) : super(AppInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AppLoggedIn>(_onAppLoggedIn);
    on<AppLoggedOut>(_onAppLoggedOut);
  }

  final UserProfileCubit userProfileCubit;

  FutureOr<void> _onAppStarted(
    AppStarted event,
    Emitter<AppState> emit,
  ) {
    emit(AppUnauthorized());
  }

  FutureOr<void> _onAppLoggedIn(
    AppLoggedIn event,
    Emitter<AppState> emit,
  ) {
    emit(AppLoadSuccess());
  }

  FutureOr<void> _onAppLoggedOut(
    AppLoggedOut event,
    Emitter<AppState> emit,
  ) {
    emit(AppUnauthorized());
  }
}
