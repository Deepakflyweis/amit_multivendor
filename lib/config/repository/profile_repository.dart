import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/user_profile_model.dart';

class ProfileRepository {
  Dio client;
  ProfileRepository({required this.client});

  editProfileApi(
      String name, String? imagePath, String email, String mobNo) async {
    CommonLoader.showLoading();

    var data = FormData.fromMap(
        {"name": name, "email": email, "phone": mobNo, "image": imagePath});

    try {
      Response response = await client.put("me/update", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: response.data["masg"]);
        g.Get.back();
      } else {
        CommonLoader.showErrorDialog(description: response.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
      log(" catch : $e.response.data");
    }
  }

  Future<UserProfileModel> getProfileApi() async {
    try {
      Response r = await client.get("me");
      if (r.statusCode == 200) {
        log("success 200 $r");
        return userProfileModelFromJson(jsonEncode(r.data["user"]));
      } else {
        log("error $r");
        return Future.error(r.data["error"]);        
      }
    } on DioError catch (e) {
      log("dio err $e");
      return Future.error(e.message);
    }
  }
}
