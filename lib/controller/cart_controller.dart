
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/card_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/cart_model.dart';

class CartController extends GetxController with StateMixin<CartModel>{

String productId = Get.arguments;

 @override
  void onInit() {
    getCartItem();
    super.onInit();
  }

  getCartItem() {
    try {
      Client _client = Client();
      CartRepo repo =CartRepo(client: _client.init());
      repo.getCartApi().then((value) {        
          change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
        log("error : $err");
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addCartItem(String productId){

    Client _client = Client();
    CartRepo repsitory = CartRepo(client: _client.init());
    try {  
      repsitory.addCartApi(id: productId).then((value) {
        log("Added in cart");
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