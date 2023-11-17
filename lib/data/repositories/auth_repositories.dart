import "package:dio/dio.dart";

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
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // final TokenModel tokenModel = TokenModel.fromJson(response.data);
    //await pref.setString(AppConsts.accessTocen, tokenModel.accessToken ?? "");
    return response.data;
  }
}
