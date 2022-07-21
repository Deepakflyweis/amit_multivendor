// import 'dart:convert';

// import 'package:flutter/foundation.dart';
 import 'package:flutter/animation.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../data/datasources/local/local_database.dart';
// import '../../data/datasources/remote/app_apis.dart';



showToastMessage({required String title, required String message}) {
  Get.snackbar(title, message, duration: const Duration(seconds: 20),colorText: Color(0xffFF001A));
}

// abstract class DataState<T> {
//   final T? data;
//   final DioError? error;

//   const DataState({this.data, this.error});
// }

// class DataSuccess<T> extends DataState<T> {
//   const DataSuccess(T data) : super(data: data);
// }

// class DataFailed<T> extends DataState<T> {
//   DataFailed(DioError error) : super(error: error) {
//     debugPrint("error $error");
//     if (Get.isDialogOpen == true) {
//       Get.back();
//     }
//     showToastMessage(
//         title: "Error",
//         message:
//             json.decode(error.response.toString())["message"] ?? error.message);
//   }
// }

// class CommonRepository {
//   static late AppApis _apiService;
//   static setApiService() {
//     _apiService = AppApis(getDio());
//   }

//   static AppApis loginApiService() {
//     return _apiService = AppApis(Dio());
//   }

//   static AppApis getApiService() {
//     return _apiService;
//   }

//   static Dio getDio() {
//     var token = Get.find<GetStorage>().read(LocalStorageKeys.KEY_TOKEN) ?? "";
//     return Dio(
//       BaseOptions(
//           contentType: 'application/json',
//           headers: {"Authorization": "Bearer $token"}),
//     );
//   }
// }
