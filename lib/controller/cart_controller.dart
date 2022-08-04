import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/card_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/cart_model.dart';

import '../views/cart_screen/cart_page.dart';

class CartController extends GetxController with StateMixin<CartModel> {
  final total = 0.0.obs;
  final subtotal = 0.0.obs;

  increase(ProductElement url) {
    Client _client = Client();
    CartRepo repsitory = CartRepo(client: _client.init());
    try {
      repsitory
          .updateQuantCartApi(
              id: url.product.id, quantity: url.quantity.value + 1)
          .then((value) {
        log("value $value");
        final model = CartModel.fromJson(value);
        url.quantity.value++;
        setTotal(model.cart.total.value.toDouble());
        setsubTotal(model.cart.subTotal.value.toDouble());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  setTotal(double total) {
    this.total.value = total;
  }

  setsubTotal(double subtotal) {
    this.subtotal.value = subtotal;
  }

  decrease(ProductElement url) {
    Client _client = Client();
    CartRepo repsitory = CartRepo(client: _client.init());
    try {
      repsitory
          .updateQuantCartApi(
              id: url.product.id, quantity: url.quantity.value - 1)
          .then((value) {
        log("value $value");

        if (url.quantity.value <= 0) {
          return null;
        } else {
          final model = CartModel.fromJson(value);
          url.quantity.value--;
          setTotal(model.cart.total.value.toDouble());
          setsubTotal(model.cart.subTotal.value.toDouble());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCartItem();
  }

  getCartItem() {
    try {
      Client _client = Client();
      CartRepo repo = CartRepo(client: _client.init());
      repo.getCartApi().then((value) {
        log("cart value ${value}");
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
      repsitory.addCartApi(id: productId).then((value) {
        log("value $value");
        if (value != null) {
          //  getCartItem();
          Get.delete<CartController>();
           Get.to(() => CartPage()); 
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
