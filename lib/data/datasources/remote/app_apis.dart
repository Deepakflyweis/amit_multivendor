// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// import 'package:sugandh/domain/params/auth/password_reset_params.dart';
// import '../../../config/server/app_server.dart';
// import '../../../domain/entities/auth/forget_otp_verify_response.dart';
// import '../../../domain/entities/auth/forget_password_response.dart';
// import '../../../domain/entities/auth/registration_response.dart';
// import '../../../domain/entities/auth/verify_registration_response/verify_registration_response.dart';
// import '../../../domain/params/auth/login_params.dart';
// import '../../../domain/params/auth/registration_params.dart';
// import '../../../domain/params/auth/verify_registration_params.dart';
// part 'app_apis.g.dart';

// @RestApi(baseUrl: serverBaseUrl)
// abstract class AppApis {
//   factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

//   @POST("register")
//   Future<HttpResponse<RegistrationResponse>> registerUser(
//       @Body() RegistrationParams params);

//   @POST("verifyRegistration")
//   Future<HttpResponse<VerifyRegistrationResponse>> verifyRegistration(
//       @Body() VerifyRegistrationParams params);

//   @POST("login")
//   Future<HttpResponse<VerifyRegistrationResponse>> loginUser(
//       @Body() LoginParams params);

//   @POST("password/forgot")
//   Future<HttpResponse<ForgetPasswordResponse>> forgetPassword(
//       @Body() Map<String, String> body);

//   @POST("password/verify-otp")
//   Future<HttpResponse<ForgetOtpVerifyResponse>> forgetVerifyOtp(
//       @Body() VerifyRegistrationParams params);

//   @POST("password/reset")
//   Future<HttpResponse<VerifyRegistrationResponse>> forgetRestPassword(
//       @Body() PasswordResetParams params);
// }
