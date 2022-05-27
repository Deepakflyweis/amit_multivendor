class VerifyRegistrationParams {
  int? phone;
  String? otp;

  VerifyRegistrationParams({this.phone, this.otp});

  factory VerifyRegistrationParams.fromJson(Map<String, dynamic> json) {
    return VerifyRegistrationParams(
      phone: json['phone'] as int?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'otp': otp,
      };
}
