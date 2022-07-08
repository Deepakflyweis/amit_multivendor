import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/category_all_model.dart';

class CategoryRepository {
  Dio client;

  CategoryRepository({required this.client});

  Future <List<CategoryModel>> getCategory() async {

    try {
      Response response = await client.get("getAllCategory");
      CommonLoader.hideLoading();
      if (response.statusCode == 201) {
        log("status = $response");
        return categoryModelFromJson(jsonEncode(response.data["categories"]));        
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
