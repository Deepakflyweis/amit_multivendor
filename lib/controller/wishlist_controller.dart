import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/wishlist_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/wishlist_model.dart';

class WishListController extends GetxController with StateMixin<WishListModel> {

  
  @override
  void onInit() {
    getWishList();
    super.onInit();
  }

  getWishList() {
    try {
      Client _client = Client();
      WishlistRepo repo =
          WishlistRepo(client: _client.init());
          repo.getWishlistApi().then((value) {        
          change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
        log("error : $err");
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
