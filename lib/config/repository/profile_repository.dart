import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/user_profile_model.dart';
import 'package:sugandh/views/accounts/account_page.dart';

class ProfileRepository {
  Dio client;
  ProfileRepository({required this.client});

  editProfileApi(String name, File image, String email) async {
    CommonLoader.showLoading();

    String mimeType = mime(image.path)!;
    String mimee = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];
    var data = FormData.fromMap({
      "name": name,
      "email": email,
      "image": await MultipartFile.fromFile(image.path,
          filename: "profile.png", contentType: MediaType(mimee, type))
    });

    log("data $data");
    try {
      Response response = await client.put("me/update", data: data);
      CommonLoader.hideLoading();
      log("data $response");
      if (response.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: response.data["msg"]);
        g.Get.offAll(() => AcoountPage());
      } else {
        CommonLoader.showErrorDialog(description: response.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
      log(" catch : ${e.response}");
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
