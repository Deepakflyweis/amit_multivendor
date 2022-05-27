import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/domain/params/auth/password_reset_params.dart';

import '../entities/auth/forget_otp_verify_response.dart';
import '../entities/auth/forget_password_response.dart';
import '../entities/auth/registration_response.dart';
import '../entities/auth/verify_registration_response/verify_registration_response.dart';
import '../params/auth/login_params.dart';
import '../params/auth/registration_params.dart';
import '../params/auth/verify_registration_params.dart';

abstract class IAuthRepository {
  Future<DataState<RegistrationResponse>> registerUser(
      RegistrationParams params);
  Future<DataState<VerifyRegistrationResponse>> verifyRegistration(
      VerifyRegistrationParams params);
  Future<DataState<VerifyRegistrationResponse>> loginUser(LoginParams params);
  Future<DataState<ForgetPasswordResponse>> forgetPassword(String number);
  Future<DataState<ForgetOtpVerifyResponse>> forgetOtpVerify(
      VerifyRegistrationParams params);
  Future<DataState<VerifyRegistrationResponse>> forgetUpdatePassword(
      PasswordResetParams params);
}
