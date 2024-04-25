part of 'scenes_page_bloc.dart';

@immutable
sealed class ScenesPageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
