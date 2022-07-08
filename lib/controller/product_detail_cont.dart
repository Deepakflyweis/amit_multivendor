import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/product_detail_repo.dart';
import 'package:sugandh/config/repository/products_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/product_details_model.dart';

class ProductDetailsController extends GetxController
    with StateMixin<ProductDetailsModel> {
  String imgId = Get.arguments;
  var isCasionFavt = false.obs;

  @override
  void onInit() {
    log("args ${Get.arguments}");
    productdetails();
    super.onInit();
  }

  productdetails() {
    try {
      Client _client = Client();
      ProductDetailRepo prodRepo = ProductDetailRepo(client: _client.init());
      prodRepo.getProductsDetail(id: imgId).then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  callAddWishList(String imgId) {
    Client _client = Client();
    ProductsRepository repsitory = ProductsRepository(client: _client.init());
    try {
      log("calling...");
      repsitory.addProductsToFav(id: imgId).then((value) {
        log("message");
      }, onError: (err) {
        log("on err ${err.toString()}");
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      log("response error $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  callRemoveFav(String imgId) {
    Client _client = Client();
    ProductsRepository repsitory = ProductsRepository(client: _client.init());
    try {
      log("calling...");
      repsitory.romoveFavProducts(id: imgId).then((value) {
        log("message");
      }, onError: (err) {
        log("on err ${err.toString()}");
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      log("response error $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
