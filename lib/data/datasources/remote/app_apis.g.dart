// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'app_apis.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps

// class _AppApis implements AppApis {
//   _AppApis(this._dio, {this.baseUrl}) {
//     baseUrl ??= 'http://mern.online:4001/api/v1/';
//   }

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<HttpResponse<RegistrationResponse>> registerUser(params) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(params.toJson());
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<RegistrationResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'register',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = RegistrationResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<HttpResponse<VerifyRegistrationResponse>> verifyRegistration(
//       params) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(params.toJson());
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<VerifyRegistrationResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'verifyRegistration',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = VerifyRegistrationResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<HttpResponse<VerifyRegistrationResponse>> loginUser(params) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(params.toJson());
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<VerifyRegistrationResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'login',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = VerifyRegistrationResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<HttpResponse<ForgetPasswordResponse>> forgetPassword(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<ForgetPasswordResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'password/forgot',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = ForgetPasswordResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<HttpResponse<ForgetOtpVerifyResponse>> forgetVerifyOtp(params) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(params.toJson());
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<ForgetOtpVerifyResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'password/verify-otp',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = ForgetOtpVerifyResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<HttpResponse<VerifyRegistrationResponse>> forgetRestPassword(
//       params) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(params.toJson());
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<HttpResponse<VerifyRegistrationResponse>>(
//             Options(method: 'POST', headers: _headers, extra: _extra)
//                 .compose(_dio.options, 'password/reset',
//                     queryParameters: queryParameters, data: _data)
//                 .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = VerifyRegistrationResponse.fromJson(_result.data!);
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
