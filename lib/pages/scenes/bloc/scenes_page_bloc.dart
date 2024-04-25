import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'scenes_page_event.dart';
part 'scenes_page_state.dart';

typedef _Event = ScenesPageEvent;
typedef _State = ScenesPageState;

class ScenesPageBloc extends Bloc<_Event, _State> {
  ScenesPageBloc() : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoadedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<DataLoadingRetriedEvent>(_onDataLoadingRetriedEvent);
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
    emit(LoadSuccessState());
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
}