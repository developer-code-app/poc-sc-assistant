import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/models/home.dart';
import 'package:poc_sc_assistant/repositories/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(InitialState());

  static Completer<List<Home>>? _completer;

  final HomeRepository repository;

  List<Home> get homes => state.findHomes();

  Future<List<Home>> loadData() async {
    if (_completer != null) {
      return _completer!.future;
    } else {
      emit(LoadInProgressState(oldState: state));
      final completer = Completer<List<Home>>();
      _completer = completer;

      try {
        final homes = await repository.fetchHomes();

        emit(LoadSuccessState(homes: homes));
        completer.complete(homes);
        _completer = null;

        return homes;
      } on Exception catch (error) {
        emit(
          LoadFailureState(
            error: error,
            oldState: state,
          ),
        );
        completer.completeError(error);
        _completer = null;

        return completer.future;
      }
    }
  }

  HomeCubit copyWith() => HomeCubit(repository: repository)..emit(state);
}

@immutable
abstract class HomeState {
  List<Home> findHomes() {
    final state = this;

    if (state is LoadSuccessState) {
      return state.homes;
    } else if (state is LoadFailureState) {
      final oldState = state.oldState;
      return (oldState is LoadSuccessState) ? oldState.homes : [];
    } else {
      return [];
    }
  }
}

class InitialState extends HomeState {}

class LoadInProgressState extends HomeState {
  LoadInProgressState({
    required this.oldState,
  });

  final HomeState oldState;
}

class LoadSuccessState extends HomeState {
  LoadSuccessState({required this.homes});

  final List<Home> homes;
}

class LoadFailureState extends HomeState {
  LoadFailureState({
    required this.error,
    required this.oldState,
  });

  final Exception error;
  final HomeState oldState;
}
