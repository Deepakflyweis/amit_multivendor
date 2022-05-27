class ForgetPasswordResponse {
  bool? success;
  String? msg;
  String? otp;

  ForgetPasswordResponse({this.success, this.msg, this.otp});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
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
