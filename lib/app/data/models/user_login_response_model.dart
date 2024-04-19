class UserLoginResponseModel {
  String token;
  String expiresAt;

  UserLoginResponseModel({
    required this.token,
    required this.expiresAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expires': expiresAt,
    };
  }

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> map) {
    return UserLoginResponseModel(
      token: map['token'] ?? '',
      expiresAt: map['expires_at'] ?? '',
    );
  }
}
