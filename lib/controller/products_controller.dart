import 'dart:developer';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/products_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/products_model.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductsModel>> {
 
  String imgId = "";
  late Rx<ProductsModel> id;

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
}
