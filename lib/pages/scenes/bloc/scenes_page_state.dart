part of 'scenes_page_bloc.dart';

@immutable
sealed class ScenesPageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.homeOSProfiles})
      : presenter = ScenesPagePresenter.fromModel(homeOSProfiles);

  final List<model.HomeOSProfile> homeOSProfiles;
  final ScenesPagePresenter presenter;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
