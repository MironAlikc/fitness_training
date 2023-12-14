import 'package:dio/dio.dart';
import 'package:fitness_training/core/const.dart';
import 'package:fitness_training/data/models/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositories {
  AuthRepositories({required this.dio});
  final Dio dio;

  Future authToken({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "usertoken/issue",
        data: {
          "username": username,
          "password": password,
        },
      );

      final TokenModel tokenModel = TokenModel.fromJson(response.data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          AppConsts.accessToken, tokenModel.accessToken ?? "");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
