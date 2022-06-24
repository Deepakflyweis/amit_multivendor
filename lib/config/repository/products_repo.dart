
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/products_model.dart';

class ProductsRepository{
   Dio client;

  ProductsRepository({required this.client});

  Future <ProductsModel> getAllProductsApi() async {

    try {
      Response response = await client.get("products");
      CommonLoader.hideLoading();
      if (response.statusCode == 201) {
        log("status = $response");
        return productsModelFromJson(jsonEncode(response.data["products"]));        
      } else {
        return Future.error(response.data["error"]);
      }
    }
    on DioError catch (e) {
      CommonLoader.hideLoading();
      return Future.error(e.message);
      
    }
  }
}