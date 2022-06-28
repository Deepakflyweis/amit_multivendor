import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/product_detail_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/product_details_model.dart';

class ProductDetailsController extends GetxController
    with StateMixin<ProductDetailsModel> {
   String imgId = Get.arguments;

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

  @override
  void onInit() {
    log("args ${Get.arguments}");
    productdetails();
    super.onInit();
  }
}
