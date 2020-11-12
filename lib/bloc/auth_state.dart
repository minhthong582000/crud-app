part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

// Uninitialized which can correspond to the state when the app is waiting to check if a user exists in our database or not
class AuthUnintialized extends AuthState {}

// Authenticated state corresponding to the successful login of a user
class AuthAuthenticated extends AuthState {}

// Unauthenticated which corresponds to the user not being authenticated yet / logged out
class AuthUnauthenticated extends AuthState {}

// Loading state which can be a state when we are waiting for the app to store a token or delete a token
class AuthLoading extends AuthState {}
