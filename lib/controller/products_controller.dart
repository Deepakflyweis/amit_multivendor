import 'dart:developer';

import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:sugandh/config/repository/products_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/models/products_model.dart';
import 'package:sugandh/views/user/login/login_screens.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductsModel>> {
  final d.Dio client = d.Dio();
  String imgId = "";
  late Rx<ProductsModel> id;
  var isCasionFavt = false.obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() {
    try {
      Client _client = Client();
      ProductsRepository prodRepo = ProductsRepository(client: _client.init());
      prodRepo.getAllProductsApi(id: imgId).then((value) {
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
        log("error : $err");
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addProductsToFav(String productid) async {
    var data = {"product": productid};
    try {
      d.Response response = await client.post("add/wishlist", data: data);
      if (response.statusCode == 200) {
        log("added fav $response");
        showToastMessage(title: "Products", message: "added successfully");
      } else {
        if (response.statusMessage == "Token_Expired") {
          Get.offAll(() => LoginScreen());
          return;
        }
      }
    } on d.DioError catch (e) {
      return Future.error(e.message);
    }
  }

  romoveFavProducts(String productid) async {
    var data = {"product": productid};
    try {
      d.Response response = await client.put("remove/wishlist", data: data);
      if (response.statusCode == 200) {
        log("remove fav $response");
        showToastMessage(title: "Products", message: "removed successfully");
      } else {
        if (response.statusMessage == "Token_Expired") {
          Get.offAll(() => LoginScreen());
          return;
        }
      }
    } on d.DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
