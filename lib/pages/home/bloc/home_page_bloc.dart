import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/models/home_os_profile.dart' as model;
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
    emit(LoadSuccessState(homeOSProfiles: model.MockData.homeOSProfiles));
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
      final homeOSProfiles = state.homeOSProfiles.map((profile) {
        return profile.home.id == event.homeId
            ? profile.copyWith(haveVisitor: !profile.haveVisitor)
            : profile.copyWith(haveVisitor: false);
      }).toList();

      emit(LoadSuccessState(homeOSProfiles: homeOSProfiles));
    }
  }
}
