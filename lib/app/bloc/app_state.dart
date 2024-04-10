part of 'app_bloc.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadInProgress extends AppState {}

class AppLoadSuccess extends AppState {}

class AppUnauthorized extends AppState {}

class AppLoadFailureState extends AppState {
  AppLoadFailureState({required this.error});

  final Exception error;
}
