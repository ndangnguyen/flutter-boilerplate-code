class UserRequestModel {
  String username;
  String password;
  String? phone;
  String? confirmPassword;

  UserRequestModel({required this.username, required this.password, this.phone, this.confirmPassword});

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'phone': phone,
      'confirmPassword': confirmPassword,
    };
  }
}
