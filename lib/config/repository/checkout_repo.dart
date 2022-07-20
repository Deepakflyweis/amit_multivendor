import 'dart:developer';

import 'package:dio/dio.dart';  
import 'package:sugandh/core/utils/common_loader.dart';

class CheckOutEndPointProvider {
  Dio client;
  CheckOutEndPointProvider({
    required this.client,
  });

  Future<Map<String, dynamic>> checkOutApi() async {
    CommonLoader.showLoading();
    try {
      Response r = await client.post("place-order");
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        log("payment $r");
        return r.data; 
      } else {
        log("else error $r");
        CommonLoader.showErrorDialog(description: r.data['error']);
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      log("dio error $e");
      CommonLoader.hideLoading(); 
      return Future.error(e.message);
    }
  }
}
