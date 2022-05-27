class RegistrationResponse {
  bool? success;
  String? msg;
  String? otp;

  RegistrationResponse({this.success, this.msg, this.otp});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'otp': otp,
      };
}
