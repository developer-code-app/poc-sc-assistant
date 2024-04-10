part of 'app_bloc.dart';

abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AppDataLoaded extends AppEvent {}

class AppLoggedIn extends AppEvent {
  AppLoggedIn({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;
}

class AppLoggedOut extends AppEvent {}

class AppLogoutRequested extends AppEvent {}

class AppRestarted extends AppEvent {}
