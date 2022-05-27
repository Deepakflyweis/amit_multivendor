class PasswordResetParams {
  String? resetToken;
  String? password;
  String? confirmPassword;

  PasswordResetParams({
    this.resetToken,
    this.password,
    this.confirmPassword,
  });

  factory PasswordResetParams.fromJson(Map<String, dynamic> json) {
    return PasswordResetParams(
      resetToken: json['resetToken'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'resetToken': resetToken,
        'password': password,
        'confirmPassword': confirmPassword,
      };
}
