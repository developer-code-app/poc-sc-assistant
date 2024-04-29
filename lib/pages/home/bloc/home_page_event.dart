part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent(this.homes);

  final List<model.Home> homes;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}

class DataLoadingRetriedEvent extends _Event {}

class SceneActionRequestedEvent extends _Event {
  SceneActionRequestedEvent({required this.homeId});

  final String homeId;
}
