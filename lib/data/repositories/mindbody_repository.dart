import 'package:dio/dio.dart';
import 'package:fitness_training/data/models/clients_model.dart';
import 'package:fitness_training/data/models/token_model.dart';
import 'package:fitness_training/data/repositories/preferences_repository.dart';

class MindbodyRepository {
  MindbodyRepository({required this.dio});
  final Dio dio;
  final _preferences = PreferencesRepository();
  Future<TokenModel> login({
    required String username,
    required String password,
  }) =>
      dio.post(
        "usertoken/issue",
        data: {
          "username": username,
          "password": password,
        },
      ).then((value) {
        final tokenModel = TokenModel.fromJson(value.data);
        return _preferences.saveToken(tokenModel).then((_) => tokenModel);
      });
  Future<ClientsModel> getClients() =>
      _preferences.getToken().then((value) => dio
              .get("client/clients",
                  options: Options(headers: {
                    'authorization': '${value.tokenType} ${value.accessToken}'
                  }))
              .then((value) {
            return ClientsModel.fromJson(value.data);
          }));
          
}
