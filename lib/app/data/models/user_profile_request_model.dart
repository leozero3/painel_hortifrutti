class UserProfileRequestModel {
  String name;
  String email;
  String? password;
  String phone;

  UserProfileRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'email': email,
      if (password != null && password!.isNotEmpty) 'password': password,
      'telefone': phone,
    };
  }

  factory UserProfileRequestModel.fromJson(Map<String, dynamic> map) {
    return UserProfileRequestModel(
      name: map['nome'],
      email: map['email'],
      password: map['password'],
      phone: map['telefone'],
    );
  }
}
