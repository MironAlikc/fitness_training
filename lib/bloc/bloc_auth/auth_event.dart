part of "auth_bloc.dart";

abstract class AuthEvent {}

class GetTokenEvent extends AuthEvent {
  GetTokenEvent({
    required this.login,
    required this.password,
  });
  String login;
  String password;
}
