part of 'scenes_page_bloc.dart';

@immutable
sealed class ScenesPageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.homes})
      : presenter = scene_presenter.ScenesPagePresenter.fromModel(homes);

  final List<Home> homes;
  final scene_presenter.ScenesPagePresenter presenter;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
