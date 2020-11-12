part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// AppStarted which will notify the block to check if a user exists
class AppStarted extends AuthEvent {}

// LoggedIn which will be the event suggesting that the user has logged in successfully
class LoggedIn extends AuthEvent {
  final User user;

  const LoggedIn({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user.username.toString() }';
}

// LoggedOut which will tell that the user has logged out
class LoggedOut extends AuthEvent {}
