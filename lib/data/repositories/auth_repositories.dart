import "package:dio/dio.dart";
import "package:fitness_training/core/const.dart";
import "package:fitness_training/data/models/token_model.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthRepositories {
  AuthRepositories({required this.dio});
  final Dio dio;

  Future authToken({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      "usertoken/issue",
      data: {
        "username": username,
        "password": password,
      },
    );
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final TokenModel tokenModel = TokenModel.fromJson(response.data);
    await pref.setString(AppConsts.accessTocen, tokenModel.accessToken ?? "");
    return response.data;
  }
}
