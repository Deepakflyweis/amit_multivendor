class RegistrationParams {
  String? name;
  String? phone;
  String? password;

  RegistrationParams({this.name, this.phone, this.password});

  factory RegistrationParams.fromJson(Map<String, dynamic> json) {
    return RegistrationParams(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'password': password,
      };
}
