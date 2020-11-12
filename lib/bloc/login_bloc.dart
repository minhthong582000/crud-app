import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/repository/user.repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({@required this.userRepository, @required this.authBloc})
      : assert(UserRepository != null),
        assert(AuthBloc != null),
        super(null);

  @override
  LoginState get initState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInitial();

      try {
        final user = await userRepository.authenticate(
            username: event.username, password: event.password);

        authBloc.add(LoggedIn(user: user));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
