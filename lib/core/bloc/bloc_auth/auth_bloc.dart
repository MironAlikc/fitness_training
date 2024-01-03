import "package:dio/dio.dart";
import "package:fitness_training/data/models/error_model.dart";
import "package:fitness_training/data/models/token_model.dart";
import "package:fitness_training/data/repositories/auth_repositories.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shared_preferences/shared_preferences.dart";

part "auth_event.dart";
part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories repo;
  late SharedPreferences prefs;
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<GetTokenEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final result = await repo.login(
          username: event.login,
          password: event.password,
        );

        emit(AuthSucces(model: result));
      } catch (e) {
        if (e is DioException) {
          final errorText =
              ErrorModel.fromJson(e.response?.data ?? <String, dynamic>{});
          emit(
            AuthError(
              error: errorText.error?.message ?? "",
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
}
