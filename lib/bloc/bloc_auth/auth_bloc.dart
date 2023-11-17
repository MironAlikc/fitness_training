import "package:dio/dio.dart";
import "package:fitness_training/data/models/error_model.dart";
import "package:fitness_training/data/models/token_model.dart";
import "package:fitness_training/data/repositories/auth_repositories.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "auth_event.dart";
part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<GetTokenEvent>((event, emit) async {
      try {
        final result = await repo.authToken(
          username: event.login,
          password: event.password,
        );
        final TokenModel data = TokenModel.fromJson(result);
        emit(
          AuthSucces(model: data),
        );
      } catch (e) {
        if (e is DioException) {
          final errorText = ErrorModel.fromJson(e.response!.data);
          emit(
            AuthError(
              error: errorText.error!.message ?? " ",
            ),
          );
        } else {
          AuthError(
            error: e.toString(),
          );
        }
      }
    });
  }
  final AuthRepositories repo;
}
