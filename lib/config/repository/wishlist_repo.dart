import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/wishlist_model.dart';

class WishlistRepo {
  Dio client;

  WishlistRepo({required this.client});

  Future<WishListModel> getWishlistApi () async{
    try{
      Response response = await client.get("wishlist/me");
      CommonLoader.hideLoading();
      if(response.statusCode == 200){
        return wishListModelFromJson(jsonEncode(response.data));
      }
       else {        
        return Future.error(response.data["error"]);
      }
    }  on DioError catch (e) {
      log("dio catch : $e");
      CommonLoader.hideLoading();
      return Future.error(e.message);
    }
  }

}
