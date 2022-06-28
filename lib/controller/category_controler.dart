import 'dart:developer';

import 'package:get/get.dart';
import 'package:sugandh/config/repository/category_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/category_all_model.dart';

class CategoryController extends GetxController
    with StateMixin<List<CategoryModel>> {
 

  getcategoryApi() {
    try {
      Client _client = Client();
      CategoryRepository categoryRepository =
          CategoryRepository(client: _client.init());
      categoryRepository.getCategory( ).then((value) {
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
        log("error : $err");
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getcategoryApi();
    super.onInit();
  }
}
