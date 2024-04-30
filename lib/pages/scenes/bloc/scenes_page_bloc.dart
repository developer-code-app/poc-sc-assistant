import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poc_sc_assistant/cubits/home_cubit.dart' as home_cubit;
import 'package:poc_sc_assistant/models/home.dart';
import 'package:poc_sc_assistant/pages/scenes/scenes_page_presenter.dart'
    as scene_presenter;

part 'scenes_page_event.dart';
part 'scenes_page_state.dart';

typedef _Event = ScenesPageEvent;
typedef _State = ScenesPageState;

class ScenesPageBloc extends Bloc<_Event, _State> {
  ScenesPageBloc({required this.homeCubit}) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoadedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<DataLoadingRetriedEvent>(_onDataLoadingRetriedEvent);

    _homeCubitSubscription = homeCubit.stream.listen((state) {
      if (state is home_cubit.LoadSuccessState) {
        add(StartedEvent());
      }
    });
  }

  final home_cubit.HomeCubit homeCubit;

  StreamSubscription? _homeCubitSubscription;

  @override
  Future<void> close() {
    _homeCubitSubscription?.cancel();

    return super.close();
  }

  FutureOr<void> _onStartedEvent(
    StartedEvent event,
    Emitter<_State> emit,
  ) {
    emit(LoadInProgressState());

    final homes = homeCubit.homes;

    if (homes.isNotEmpty) {
      add(DataLoadedEvent(homes: homes));
    }
  }

  FutureOr<void> _onDataLoadedEvent(
    DataLoadedEvent event,
    Emitter<_State> emit,
  ) {
    emit(LoadSuccessState(homes: event.homes));
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
