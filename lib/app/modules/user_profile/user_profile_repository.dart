import 'package:painel_hortifrutti/app/data/models/user_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_profile_request_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class UserProfileRepository {
  final Api _api;

  UserProfileRepository(this._api);

  Future<UserModel> getUser() {
    return _api.getUser();
  }

  Future<UserModel> putUser(UserProfileRequestModel userProfileRequest) =>
      _api.putUser(userProfileRequest);
}
