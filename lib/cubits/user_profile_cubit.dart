import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_sc_assistant/models/user_profile.dart';
import 'package:poc_sc_assistant/repositories/user_repository.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({required this.repository}) : super(InitialState());

  static Completer<UserProfile>? _completer;

  final UserRepository repository;

  UserProfile? get profile => state.findProfile();

  Future<UserProfile> findProfile() async {
    final profile = this.profile;

    if (profile == null) {
      return loadData();
    }

    return profile;
  }

  Future<UserProfile> loadData() async {
    if (_completer != null) {
      return _completer!.future;
    } else {
      emit(LoadInProgressState());
      final completer = Completer<UserProfile>();
      _completer = completer;

      try {
        final profile = await repository.fetchProfile();

        emit(LoadSuccessState(profile: profile));
        completer.complete(profile);
        _completer = null;

        return profile;
      } on Exception catch (error) {
        final UserProfile? profile = (state is LoadSuccessState)
            ? (state as LoadSuccessState).profile
            : null;

        emit(
          LoadFailureState(
            error: error,
            oldProfile: profile,
          ),
        );
        completer.completeError(error);
        _completer = null;

        return completer.future;
      }
    }
  }
}

@immutable
abstract class UserProfileState {
  UserProfile? findProfile() {
    final state = this;

    if (state is LoadSuccessState) {
      return state.profile;
    } else if (state is LoadFailureState) {
      return state.oldProfile;
    } else {
      return null;
    }
  }
}

class InitialState extends UserProfileState {}

class LoadInProgressState extends UserProfileState {}

class LoadSuccessState extends UserProfileState {
  LoadSuccessState({required this.profile});

  final UserProfile profile;
}

class LoadFailureState extends UserProfileState {
  LoadFailureState({
    required this.error,
    this.oldProfile,
  });

  final Exception error;
  final UserProfile? oldProfile;
}
