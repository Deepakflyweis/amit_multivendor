
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/cart_model.dart';
import 'package:sugandh/views/user/login/login_screens.dart';

class CartRepo {
  Dio client;

  CartRepo({required this.client});

  Future<CartModel> getCartApi() async{
    try{
      Response response = await client.get("cart");
      CommonLoader.hideLoading();
      if(response.statusCode == 200){
        return cartModelFromJson(jsonEncode(response.data));
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

  addCartApi({required String id}) async {
    var data = {"product": id};
    log("data $data");
    try {
      Response response = await client.post("cart/$id", data: data);
      if (response.statusCode == 200) {
        log("added in cart $response");        
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