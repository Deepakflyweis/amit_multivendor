import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/card_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/cart_model.dart';

class CartController extends GetxController with StateMixin<CartModel> {
  var _products = {}.obs;

  void addProd(CartModel cartModel) {
    if (_products.containsKey(cartModel)) {
      _products[cartModel] += 1;
    } else {
      _products[cartModel] = 1;
    }
  }

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }

  getCartItem() {
    try {
      Client _client = Client();
      CartRepo repo = CartRepo(client: _client.init());
      repo.getCartApi().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      log("catch : $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addCartItem(String productId) {
    Client _client = Client();
    CartRepo repsitory = CartRepo(client: _client.init());
    try {
      repsitory.addCartApi(id: productId).then((value) {}, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
