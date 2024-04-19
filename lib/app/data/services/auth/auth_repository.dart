import 'package:painel_hortifrutti/app/data/models/user_login_request_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_login_response_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<UserLoginResponseModel> login(
          UserLoginRequestModel userLoginRequest) async =>
      _api.login(userLoginRequest);

  Future<UserModel> getUser() => _api.getUser();
}
