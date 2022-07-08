import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sugandh/models/product_details_model.dart';

class ProductDetailRepo {
  Dio client;
  ProductDetailRepo({required this.client});

   Future<ProductDetailsModel> getProductsDetail({required String id}) async{
    try {
      Response r = await client.get("product/$id");
      if (r.statusCode == 200) {
         
        return productDetailsModelFromJson(jsonEncode(r.data["product"]));
      } else {
        log("error $r");
        return Future.error(r.data["error"]);        
      }
    } on DioError catch (e) {
      log("dio err $e");
      return Future.error(e.message);
    }
  }
 }
 
