part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.homeOSProfiles})
      : presenter = HomePagePresenter.fromModel(homeOSProfiles: homeOSProfiles);

  final List<model.HomeOSProfile> homeOSProfiles;
  final HomePagePresenter presenter;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
