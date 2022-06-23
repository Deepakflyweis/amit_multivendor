// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:sugandh/core/utils/app_utils.dart';
// import 'package:dio/dio.dart';
// import 'package:sugandh/domain/entities/auth/forget_otp_verify_response.dart';
// import 'package:sugandh/domain/entities/auth/forget_password_response.dart';
// import 'package:sugandh/domain/params/auth/password_reset_params.dart';
// import '../../domain/entities/auth/registration_response.dart';
// import '../../domain/entities/auth/verify_registration_response/verify_registration_response.dart';
// import '../../domain/params/auth/login_params.dart';
// import '../../domain/params/auth/registration_params.dart';
// import '../../domain/params/auth/verify_registration_params.dart';
// import '../../domain/repository/iauth_repository.dart';

// class AuthRepositoryImpl extends IAuthRepository {
//   @override
//   Future<DataState<RegistrationResponse>> registerUser(
//       RegistrationParams params) async {
//     debugPrint("body ${params.toJson()}");
//     try {
//       final httpResponse =
//           await CommonRepository.getApiService().registerUser(params);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }

//   @override
//   Future<DataState<VerifyRegistrationResponse>> verifyRegistration(
//       VerifyRegistrationParams params) async {
//     try {
//       final httpResponse =
//           await CommonRepository.getApiService().verifyRegistration(params);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }

//   @override
//   Future<DataState<VerifyRegistrationResponse>> loginUser(
//       LoginParams params) async {
//     try {
//       final httpResponse =
//           await CommonRepository.getApiService().loginUser(params);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }

//   @override
//   Future<DataState<ForgetPasswordResponse>> forgetPassword(
//       String number) async {
//     try {
//       final map = <String, String>{};
//       map["phone"] = number;
//       debugPrint("map $map");
//       final httpResponse =
//           await CommonRepository.getApiService().forgetPassword(map);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }

//   @override
//   Future<DataState<ForgetOtpVerifyResponse>> forgetOtpVerify(
//       VerifyRegistrationParams params) async {
//     try {
//       final httpResponse =
//           await CommonRepository.getApiService().forgetVerifyOtp(params);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }

//   @override
//   Future<DataState<VerifyRegistrationResponse>> forgetUpdatePassword(
//       PasswordResetParams params) async {
//     try {
//       debugPrint("params ${params.toJson()}");
//       final httpResponse =
//           await CommonRepository.getApiService().forgetRestPassword(params);
//       if (httpResponse.response.statusCode == HttpStatus.ok ||
//           httpResponse.response.statusCode == HttpStatus.created) {
//         return DataSuccess(httpResponse.data);
//       }
//       return DataFailed(
//         DioError(
//           error: httpResponse.response.statusMessage,
//           response: httpResponse.response,
//           requestOptions: httpResponse.response.requestOptions,
//           type: DioErrorType.response,
//         ),
//       );
//     } on DioError catch (e) {
//       debugPrint("DioError ${e.response.toString()}");
//       return DataFailed(e);
//     }
//   }
// }
