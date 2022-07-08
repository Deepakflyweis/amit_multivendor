import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sugandh/controller/search_cont.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/models/search_model.dart';

class SearchRepository {
  Dio client;

  SearchRepository({required this.client});

   
  Future<List<SearchModel>> getSearchResult({required String value}) async {
    try {
      Response response = await client.get("products?keyword=$value");
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {        
        SearchController().isLoading.value = false;
          return searchModelFromJson(jsonEncode(response.data["products"]));
      } else {
        return Future.error(response.data["error"]);
      }
    } on DioError catch (e) {
      log("dio catch : $e");
      CommonLoader.hideLoading();
      return Future.error(e.message);
    }
   
  }
}
