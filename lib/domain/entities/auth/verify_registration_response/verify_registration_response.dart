import 'user.dart';

class VerifyRegistrationResponse {
  bool? success;
  User? user;
  String? token;
  bool? accountVerified;

  VerifyRegistrationResponse({
    this.success,
    this.user,
    this.token,
    this.accountVerified,
  });

  factory VerifyRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return VerifyRegistrationResponse(
      success: json['success'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      accountVerified: json['accountVerified'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'user': user?.toJson(),
        'token': token,
        'accountVerified': accountVerified,
      };
}
