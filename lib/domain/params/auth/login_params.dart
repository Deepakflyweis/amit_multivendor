class LoginParams {
  int? phone;
  String? password;

  LoginParams({this.phone, this.password});

  factory LoginParams.fromJson(Map<String, dynamic> json) => LoginParams(
        phone: json['phone'] as int?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
      };
}
