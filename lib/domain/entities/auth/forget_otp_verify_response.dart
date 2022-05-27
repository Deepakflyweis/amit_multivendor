class ForgetOtpVerifyResponse {
  String? resetToken;

  ForgetOtpVerifyResponse({this.resetToken});

  factory ForgetOtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return ForgetOtpVerifyResponse(
      resetToken: json['resetToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'resetToken': resetToken,
      };
}
