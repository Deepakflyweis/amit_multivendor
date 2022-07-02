import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/search_repo.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/models/search_model.dart';

class SearchController extends GetxController
    with StateMixin<List<SearchModel>> {

  var newsList = List<SearchModel>.empty(growable: true).obs;
  RxBool isLoading = true.obs;
  TextEditingController value1 = TextEditingController();
  RxBool isPause = false.obs;
  ScrollController scrollController = ScrollController();
  
  callSearchApi() {
    Client client = Client();
    SearchRepository repository = SearchRepository(client: client.init());

    try {
      repository.getSearchResult(value: value1.text).then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callSearchApi();
    super.onInit();
  }
}
