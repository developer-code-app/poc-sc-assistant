part of 'scenes_page_bloc.dart';

@immutable
sealed class ScenesPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent(this.error);

  final Exception error;
}

class DataLoadingRetriedEvent extends _Event {}
