part of "auth_bloc.dart";

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthError extends AuthState {
  AuthError({required this.error});
  final String error;
}

class AuthSucces extends AuthState {
  AuthSucces({required this.model});
  final TokenModel model;
}
