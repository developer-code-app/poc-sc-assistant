part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {}

class LoadSuccessState extends _State {
  LoadSuccessState({required this.homes})
      : presenter = HomePagePresenter.fromModel(homes: homes);

  final List<Home> homes;
  final HomePagePresenter presenter;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
