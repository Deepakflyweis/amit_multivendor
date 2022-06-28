import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/products_model.dart';

class ProductsRepository {
  Dio client;

  ProductsRepository({required this.client});

  Future<List<ProductsModel>> getAllProductsApi({required String id }) async {
    try {
      Response response = await client.get("products/$id");
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        log("status = $response");
        return productsModelFromJson(jsonEncode(response.data["products"]));
      } else {
        log("api error : $response");
        return Future.error(response.data["error"]);
      }
    } on DioError catch (e) {
      log("dio catch : $e");
      CommonLoader.hideLoading();
      return Future.error(e.message);
      
    }
  }
}
