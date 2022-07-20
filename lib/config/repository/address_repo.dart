import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/views/check_out_screens/check_out_payment.dart';

class CheckoutAddressRepo {
  Dio client;
  CheckoutAddressRepo({required this.client});

  cartAddressSend(
    String street,
    String locality,
    String pincode,
    String city,
    String state,
  ) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "street": street,
        "pinCode": pincode,
        "state": state,
        "city": city,
        "address": locality
      };
      Response response = await client.post("checkout", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        g.Get.to(() => CheckOutPayment());
      } else {
        log("else error $response");
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      log("dio error $e");
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message.toString());
    }
  }
}
