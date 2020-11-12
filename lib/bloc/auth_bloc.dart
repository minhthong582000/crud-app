import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:login_form/model/user.model.dart';
import 'package:login_form/repository/user.repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(null);

  @override
  AuthState get initialState => AuthUnauthenticated();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();

      await userRepository.persistToken(user: event.user);

      yield AuthAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthLoading();

      await userRepository.deleteToken(id: 0);

      yield AuthUnauthenticated();
    }
  }
}
