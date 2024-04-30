part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class InitialState extends _State {}

class LoadInProgressState extends _State {
  LoadInProgressState({required this.projectName});
  
  final String projectName;
}

class LoadSuccessState extends _State {
  LoadSuccessState({
    required this.projectName,
    required this.homes,
  }) : presenter = HomePagePresenter.fromModel(
          projectName: projectName,
          homes: homes,
        );

  final String projectName;
  final List<model.Home> homes;
  final HomePagePresenter presenter;
}

class LoadFailureState extends _State {
  LoadFailureState(this.error);

  final Exception error;
}
