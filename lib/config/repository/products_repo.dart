import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/products_model.dart';
import 'package:sugandh/views/user/login/login_screens.dart';

class ProductsRepository {
  Dio client;

  ProductsRepository({required this.client});

  Future<List<ProductsModel>> getAllProductsApi({required String id}) async {
    try {
      Response response = await client.get("products/$id");
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        return productsModelFromJson(jsonEncode(response.data["products"]));
      } else {
        log("api error : $response");
        return Future.error(response.data["error"]);
      }
    } on DioError catch (e) {
      log("dio catch : $e");
      CommonLoader.hideLoading();
      return Future.error(e.message);
    }
  }

  addProductsToFav({required String id}) async {
    var data = {"product": id};
    log("data $data");
    try {
      Response response = await client.post("add/wishlist/$id", data: data);
      if (response.statusCode == 200) {
        log("added fav $response");
        showToastMessage(title: "Products", message: "added successfully");
      } else {
        if (response.statusMessage == "Token_Expired") {
          g.Get.offAll(() => LoginScreen());
          return;
        }
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  romoveFavProducts({required String id}) async {
    var data = {"product": id};
    log("data $data");
    try {
      Response response = await client.put("remove/wishlist/$id", data: data);
      if (response.statusCode == 200) {
        log("added fav $response");
        showToastMessage(title: "Products", message: "removed successfully");
      } else {
        if (response.statusMessage == "Token_Expired") {
          g.Get.offAll(() => LoginScreen());
          return;
        }
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
