import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/pages/home/home_page_presenter.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

typedef _Event = HomePageEvent;
typedef _State = HomePageState;

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoadedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<DataLoadingRetriedEvent>(_onDataLoadingRetriedEvent);
    on<SceneActionRequestedEvent>(_onSceneActionRequestedEvent);
  }

  FutureOr<void> _onStartedEvent(
    StartedEvent event,
    Emitter<_State> emit,
  ) {
    emit(LoadInProgressState());
    add(DataLoadedEvent());
  }

  FutureOr<void> _onDataLoadedEvent(
    DataLoadedEvent event,
    Emitter<_State> emit,
  ) {
    final homes = [
      Home(id: '1', address: '889/1', currentScene: 'Standby'),
      Home(id: '2', address: '889/2', currentScene: 'Standby'),
      Home(id: '3', address: '889/3', currentScene: 'Standby'),
      Home(id: '4', address: '889/4', currentScene: 'Active'),
    ];

    emit(LoadSuccessState(homes: homes));
  }

  FutureOr<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) {
    emit(LoadFailureState(event.error));
  }

  FutureOr<void> _onDataLoadingRetriedEvent(
    DataLoadingRetriedEvent event,
    Emitter<_State> emit,
  ) {
    add(StartedEvent());
  }

  FutureOr<void> _onSceneActionRequestedEvent(
    SceneActionRequestedEvent event,
    Emitter<_State> emit,
  ) {
    final state = this.state;

    if (state is LoadSuccessState) {
      final homes = state.homes;

      homes.where(
        (home) {
          return home.id == event.homeId
              ? home.isSceneStarted = !event.isSceneStarted
              : home.isSceneStarted = false;
        },
      ).toList();

      emit(LoadSuccessState(homes: homes));
    }
  }
}

// TODO(Nolthicha): remove this when implement model.
class Home {
  Home({
    required this.id,
    required this.address,
    required this.currentScene,
    this.isSceneStarted = false,
  });

  final String id;
  final String address;
  final String currentScene;
  bool isSceneStarted;
}
